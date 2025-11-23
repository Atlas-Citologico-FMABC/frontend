import 'package:flutter/material.dart';
import '../services/directory_service.dart';
import 'button.dart';
import 'input_field.dart';

final Color darkBlue = Color(0xff002C53);
final Color green = Color(0xff009951);
final Color lightGray = Color(0xffEBEBEB);

class EditDirectoryDialog extends StatefulWidget {
  final VoidCallback refresh, onCancel;
  final String initialTitle, initialDescription, saveButtonText, cancelButtonText;
  const EditDirectoryDialog({
    super.key,
    required this.refresh,
		required this.onCancel,
    required this.initialTitle,
    required this.initialDescription,
		this.saveButtonText = 'Salvar',
		this.cancelButtonText = 'Cancelar',
  });

  @override
  State<EditDirectoryDialog> createState() => _EditDialogState();
}

class _EditDialogState extends State<EditDirectoryDialog> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController titleController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.initialTitle);
    descriptionController = TextEditingController(
      text: widget.initialDescription,
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
			constraints: BoxConstraints(maxWidth: 1300),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 8,
      backgroundColor: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: SizedBox(
          height: 200,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 10, left: 20),
                      child: Text('Título'),
                    ),
                    Expanded(
                      child: InputField(
                        validator: false,
                        controller: titleController,
                        // errorText: 'Digite uma nova descrição',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black.withAlpha(50),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: darkBlue),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, left: 20),
                      child: Text('Descrição'),
                    ),
                    Expanded(
                      child: InputField(
                        validator: false,
                        controller: descriptionController,
                        // errorText: 'Digite um novo título', // caso mudar o validator para true
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black.withAlpha(50),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: darkBlue),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Row(
									mainAxisAlignment: MainAxisAlignment.center,
									spacing: 20,
                  children: [
                    Button(
                      text: widget.saveButtonText,
                      onTap: () async {
                        final res = await DirectoryService().updateDirectory(
                          widget.initialTitle,
                          titleController.text,
                          descriptionController.text,
                        );
                        if (res.statusCode == 200) {
                          widget.refresh();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: green,
                              content: Text('Diretório editado com sucesso.'),
                              duration: Duration(seconds: 3),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red,
                              content: Text('Falha ao tentar editar o diretório.'),
                              duration: Duration(seconds: 3),
                            ),
                          );
                        }
                        Navigator.pop(context);
                      },
                      backgroundColor: green,
                      foregroundColor: Colors.white,
                    ),
                    Button(
											text: widget.cancelButtonText,
											onTap: widget.onCancel,
											backgroundColor: lightGray,
										),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
