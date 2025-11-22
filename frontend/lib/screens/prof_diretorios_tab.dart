import 'package:flutter/material.dart';
import '../widgets/diretorio_box.dart';
import '../services/directory_service.dart';
import '../widgets/floating_round_button.dart';

final Color lightGray = const Color(0xffEBEBEB);

class ProfDiretoriosTab extends StatefulWidget {
  final void Function(
    List<String> imageFolderNames, {
    String? title,
    String? description,
  })
  openTeacherDirectory;

  const ProfDiretoriosTab({super.key, required this.openTeacherDirectory});

  @override
  State<ProfDiretoriosTab> createState() => _ProfDiretoriosTabState();
}

class _ProfDiretoriosTabState extends State<ProfDiretoriosTab> {
  late Future<List<Directory>> _future;
  final _service = DirectoryService();

  @override
  void initState() {
    super.initState();
    _future = _service.getAll();
  }

  String _descriptionPreview(String d) => d.isEmpty
      ? 'Sem descrição...'
      : (d.length > 40 ? '${d.substring(0, 40)}...' : '$d...');

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Atlas de Citologia - Diretórios',
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
                    child: FutureBuilder<List<Directory>>(
                      future: _future,
                      builder: (context, snap) {
                        if (snap.connectionState == ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (snap.hasError) {
                          return Center(
                            child: Text(
                              'Erro ao carregar diretórios:\n${snap.error}',
                            ),
                          );
                        }
                        final itens = snap.data ?? const [];
                        if (itens.isEmpty) {
                          return const Center(
                            child: Text('Nenhum diretório encontrado.'),
                          );
                        }
                        return SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 50,
                            runSpacing: 30,
                            children: [
                              for (final d in itens)
                                Column(
                                  children: [
                                    DiretorioBox(
                                      title: d.title,
                                      onTap: () => widget.openTeacherDirectory(
                                        d.imageFolderNames,
                                        title: d.title,
                                        description: d.description,
                                      ),
                                      borderWidth: 0,
                                      borderColor: Colors.transparent,
                                    ),
                                    SizedBox(height: 10),
                                    Text(_descriptionPreview(d.description)),
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
        ),
        FloatingRoundButton(onPressed: () {}),
      ],
    );
  }
}
