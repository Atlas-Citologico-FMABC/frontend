import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../widgets/image_box.dart';
import '../screens/image_viewer_tab.dart';

final Color lightGray = Color(0xffEBEBEB);
final Color darkBlue = const Color(0xff05172D);

class DiretorioTab extends StatelessWidget {
  final List<String>? folderNames;
  final String? title;
  final String? description;

  final Function(String)? onTapImage;

  const DiretorioTab({
    super.key,
    required this.onTapImage,
    this.folderNames,
    this.title,
    this.description,
  });

  Future<String> get _tilesPath async {
    final directory = await getApplicationDocumentsDirectory();
    return p.join(directory.path, 'tiles');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _tilesPath,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Erro: ${snapshot.error}');
        } else if (!snapshot.hasData) {
          return const Text('Caminho não encontrado');
        }

        final tilesPath = snapshot.data!;
        final tilesRoot = Directory(tilesPath);
        if (!tilesRoot.existsSync()) {
          return const Padding(
            padding: EdgeInsets.only(top: 50),
            child: Center(
              child: Text('Nenhum conteúdo encontrado em "tiles/".'),
            ),
          );
        }

        // Todas as subpastas existentes em tiles/
        final existingSubdirs = tilesRoot
            .listSync(followLinks: false)
            .whereType<Directory>()
            .toList();

        final allow = (folderNames ?? const <String>[])
            .map((e) => e.toLowerCase())
            .toSet();

        final toShow = allow.isEmpty
            ? existingSubdirs
            : existingSubdirs.where((d) {
                final name = p.basename(d.path).toLowerCase();
                return allow.contains(name);
              }).toList();

        List<Directory> orderedToShow;
        if (allow.isNotEmpty) {
          final mapByName = {
            for (final d in toShow) p.basename(d.path).toLowerCase(): d,
          };
          orderedToShow = [
            for (final name in folderNames!)
              if (mapByName[name.toLowerCase()] != null)
                mapByName[name.toLowerCase()]!,
          ];
        } else {
          orderedToShow = toShow
            ..sort((a, b) => p.basename(a.path).compareTo(p.basename(b.path)));
        }

        return Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title ?? 'Atlas de Citologia - Diretório',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 45,
                      ),
                    ),
                    const Divider(color: Colors.white),
                    if ((description ?? '').isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Text(
                        description!,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                    ],
                    const SizedBox(height: 30),
                  ],
                ),
              ),

              // Conteúdo
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xffEBEBEB),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.elliptical(700, 70),
                      topRight: Radius.elliptical(700, 70),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 100,
                      right: 50,
                      bottom: 70,
                      left: 50,
                    ),
                    child: Builder(
                      builder: (context) {
                        if (orderedToShow.isEmpty) {
                          final info = allow.isEmpty
                              ? 'Nenhuma pasta de imagem encontrada em tiles/.'
                              : 'Nenhuma das pastas de imagem especificadas existe em tiles/.';
                          return Center(child: Text(info));
                        }
                        return SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
														crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Wrap(
                                spacing: 50,
                                runSpacing: 30,
                                children: [
                                  for (final dir in orderedToShow)
                                    FutureBuilder<_SmallestResult?>(
                                      future:
                                          compute<_SmallestArgs, _SmallestResult?>(
                                            _pickSmallestImageIsolate,
                                            _SmallestArgs(folderAbs: dir.path),
                                          ),
                                      builder: (context, snap) {
                                        final folderName = p.basename(dir.path);
                                        final thumbPath = snap.data?.path;
                                        final preview = (thumbPath != null)
                                            ? DecorationImage(
                                                image: FileImage(File(thumbPath)),
                                                // fit: BoxFit.cover,
                                              )
                                            : const DecorationImage(
                                                image: AssetImage(
                                                  'assets/images/image.png',
                                                ),
                                              );
                              
                                        return ImageBox(
                                          title: folderName,
                                          previewImage: preview,
                                          onTap: () => onTapImage?.call(folderName),
                                          borderColor: Colors.transparent,
                                          borderWidth: 0,
                                        );
                                      },
                                    ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
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

  File? best;
  int? bestSize;

  for (final entity in dir.listSync(recursive: true, followLinks: false)) {
    if (entity is File) {
      final ext = p.extension(entity.path).toLowerCase();
      if (ext == '.png' || ext == '.jpg' || ext == '.jpeg' || ext == '.webp') {
        try {
          final size = entity.lengthSync();
          if (best == null || size < (bestSize ?? 1 << 30)) {
            best = entity;
            bestSize = size;
          }
        } catch (_) {}
      }
    }
  }

  if (best == null) return null;
  return _SmallestResult(path: best.path);
}
