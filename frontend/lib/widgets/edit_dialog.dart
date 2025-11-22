import 'package:flutter/material.dart';
import '../services/admin.dart';
import 'button.dart';
import 'input_field.dart';

final Color darkBlue = Color(0xff002C53);
final Color green = Color(0xff009951);

class EditDialog extends StatefulWidget {
	final String emailToEdit;
  final String initialName;
  const EditDialog({
    super.key,
    required this.emailToEdit,
    required this.initialName,
  });

  @override
  State<EditDialog> createState() => _EditDialogState();
}

class _EditDialogState extends State<EditDialog> {
  final _formKey = GlobalKey<FormState>();

	late TextEditingController senhaController;
	late TextEditingController nomeController;

	@override
	void initState() {
		super.initState();
		senhaController = TextEditingController();
		nomeController = TextEditingController(text: widget.initialName);
	}

	@override
	void dispose() {
		senhaController.dispose();
		nomeController.dispose();
		super.dispose();
	}

  @override
  Widget build(BuildContext context) {

    return Dialog(
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
                      child: Text('Nome'),
                    ),
                    Expanded(
                      child: InputField(
												validator: true,
                        controller: nomeController,
                        errorText: 'Digite um novo nome',
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
                      child: Text('Senha'),
                    ),
                    Expanded(
                      child: InputField(
												validator: false,
												controller: senhaController,
                        // errorText: 'Digite uma nova senha', // caso mudar o validator para true
                        // obscureText: true,
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
                Button(
                  text: 'Salvar',
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      final res = await AdminService().atualizarProfessor(
                        widget.emailToEdit,
                        senhaController.text,
                        nomeController.text,
                      );
                      if (res.statusCode == 200) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: green,
                            content: Text('Professor editado com sucesso.'),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(
                              'Falha ao tentar editar o professor.',
                            ),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      }
                      Navigator.pop(context);
                    }
                  },
                  backgroundColor: green,
                  foregroundColor: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
