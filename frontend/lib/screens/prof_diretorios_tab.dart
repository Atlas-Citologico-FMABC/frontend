import 'package:flutter/material.dart';
import '../widgets/delete_image_dialog.dart';
import '../widgets/diretorio_box.dart';
import '../services/directory_service.dart';
import '../widgets/edit_directory_dialog.dart';
import '../widgets/floating_round_button.dart';

final Color green = Color(0xff009951);
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

  Future<void> _refresh() async {
    setState(() {
      _future = _service.getAll();
    });
  }

  Future<void> _onEditDirectory(String title, String description) async {
    await showDialog<bool>(
      context: context,
      builder: (_) => EditDirectoryDialog(
				refresh: _refresh,
				onCancel: () => Navigator.pop(context),
				initialTitle: title,
				initialDescription: description
      ),
    );
  }

  Future<void> _onDeleteDirectory(String directoryName) async {
    await showDialog<bool>(
      context: context,
      builder: (_) => DeleteImageDialog( // usando DeleteImageDialog por conta da flexibilidade, depois sera modificado para DeleteDialog
        onDelete: () async {
          final res = await DirectoryService().deleteDirectory(directoryName);
          if (res.statusCode == 200) {
						_refresh();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: green,
                content: Text('Diretório excluído com sucesso'),
                duration: Duration(seconds: 3),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text('Falha ao tentar excluir diretório.'),
                duration: Duration(seconds: 3),
              ),
            );
          }
          Navigator.pop(context);
        },
        onCancel: () => Navigator.pop(context),
        title: 'Excluir diretório',
        text: 'Tem certeza que deseja excluir o diretório?',
        deleteButtonText: 'Excluir',
      ),
    );
  }

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
                          child: Column(
														crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Wrap(
                                spacing: 50,
                                runSpacing: 30,
                                children: [
                                  for (final d in itens)
                                    Column(
                                      children: [
                                        Stack(
                                          children: <Widget> [
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
																						FloatingRoundButton(
																							onPressed: () => _onDeleteDirectory(d.title),
																							right: 50,
																							bottom: 0,
																							width: 30,
																							backgroundColor: Colors.red,
																							icon: Icons.delete,
																						),
																						FloatingRoundButton(
																							onPressed: () => _onEditDirectory(d.title, d.description),
																							right: 10,
																							bottom: 0,
																							backgroundColor: Colors.blue,
																							width: 30,
																							icon: Icons.edit,
																						),
																					],
																				),
                                        SizedBox(height: 10),
                                        Text(_descriptionPreview(d.description)),
                                      ],
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
        ),
        FloatingRoundButton(onPressed: () {}),
      ],
    );
  }
}
