import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import '../main.dart';
import '../services/image_service.dart';
import '../widgets/image_box.dart';

final Color lightGray = const Color(0xffEBEBEB);

class GaleriaTab extends StatefulWidget {
	final void Function(String) openImageViewer;
  const GaleriaTab({super.key, required this.openImageViewer});

  @override
  State<GaleriaTab> createState() => _GaleriaTabState();
}

class _GaleriaTabState extends State<GaleriaTab> {
  late Future<List<_GalleryItem>> _future;

  @override
  void initState() {
    super.initState();
    _future = _loadAll();
  }

  Future<List<_GalleryItem>> _loadAll() async {
    final res = await ImageService().getAllImages();
    if (res.statusCode != 200) {
      throw Exception('Erro ao buscar imagens: ${res.statusCode}');
    }

    final List data = jsonDecode(res.body) as List;

    final baseDir = await _tilesBasePath();
    final items = <_GalleryItem>[];

    // usando Future.wait com compute para paralelizar as varreduras de pasta,
    // sem bloquear a UI. Cada pasta roda em um isolate separado.
    final futures = <Future<_GalleryItem?>>[];

    for (final raw in data) {
      final map = raw as Map<String, dynamic>;
      final folder = (map['imageFolderName'] ?? '').toString().trim();
      final title = (map['title'] ?? '').toString().trim();
      if (folder.isEmpty || title.isEmpty) continue;

      final folderAbs = p.join(baseDir, folder);

      futures.add(
        compute<_SmallestArgs, _SmallestResult?>(
          _pickSmallestImageIsolate,
          _SmallestArgs(folderAbs: folderAbs),
        ).then((result) {
          final previewPath = result?.path;
          return _GalleryItem(title: title, previewPath: previewPath);
        }).catchError((_) {
          // falha ao varrer a pasta -> volta item com preview nulo (usa placeholder)
          return _GalleryItem(title: title, previewPath: null);
        }),
      );
    }

    final resolved = await Future.wait(futures);
    for (final e in resolved) {
      if (e != null) items.add(e);
    }
    return items;
  }

  Future<String> _tilesBasePath() async {
    final dir = await getApplicationDocumentsDirectory();
    return p.join(dir.path, 'tiles');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(30),
            child: const Column(
              children: [
                Text(
                  'Atlas de Citologia - Galeria',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 45,
                  ),
                ),
                Divider(color: Colors.white),
                SizedBox(height: 30),
              ],
            ),
          ),
          Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xffEBEBEB),
              borderRadius: BorderRadius.only(
                topLeft: Radius.elliptical(700, 70),
                topRight: Radius.elliptical(700, 70),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  FutureBuilder<List<_GalleryItem>>(
                    future: _future,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const SizedBox(
                          height: 160,
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }
                      if (snapshot.hasError) {
                        return Text(
                          'Erro ao carregar galeria: ${snapshot.error}',
                        );
                      }
                      final items = snapshot.data ?? [];
                      if (items.isEmpty) {
                        return const Text('Nenhuma imagem disponível');
                      }

                      return Wrap(
                        spacing: 50,
                        runSpacing: 50,
                        children: [
                          for (final e in items)
                            ImageBox(
                              title: e.title,
                              previewImage: e.previewPath == null
                                  ? const DecorationImage(
                                      image: AssetImage('assets/images/image.png'),
                                    )
                                  : DecorationImage(
                                      image: FileImage(File(e.previewPath!)),
                                      // fit: BoxFit.cover,
                                    ),
															onTap: () => widget.openImageViewer(e.previewPath!), // passando o preview apenas para testar abrir a imagem.. ainda deve-se integrar com a lógica das imagens, o que provavelmente receberá um imageFolderName.
                            ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GalleryItem {
  final String title;
  final String? previewPath;
  _GalleryItem({required this.title, required this.previewPath});
}

class _SmallestArgs {
  final String folderAbs;
  const _SmallestArgs({required this.folderAbs});
}

class _SmallestResult {
  final String path;
  const _SmallestResult({required this.path});
}

_SmallestResult? _pickSmallestImageIsolate(_SmallestArgs args) {
  final dir = Directory(args.folderAbs);
  if (!dir.existsSync()) return null;

  final files = dir
      .listSync(recursive: true)
      .whereType<File>()
      .where((f) {
        final ext = p.extension(f.path).toLowerCase();
        return ext == '.jpeg' || ext == '.jpg' || ext == '.png';
      })
      .toList();
  if (files.isEmpty) return null;

  files.sort((a, b) => a.lengthSync().compareTo(b.lengthSync()));
  return _SmallestResult(path: files.first.path);
}

