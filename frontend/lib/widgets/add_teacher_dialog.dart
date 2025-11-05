import 'package:flutter/material.dart';
import '../services/admin.dart';
import 'button.dart';
import 'input_field.dart';

final Color darkBlue = Color(0xff002C53);
final Color green = Color(0xff009951);

class AddTeacherDialog extends StatefulWidget {
  const AddTeacherDialog({super.key});

  @override
  State<AddTeacherDialog> createState() => _AddTeacherDialogState();
}

class _AddTeacherDialogState extends State<AddTeacherDialog> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController emailController;
  late TextEditingController senhaController;
  late TextEditingController nomeController;

	@override
	void initState() {
		super.initState();
		emailController = TextEditingController();
		senhaController = TextEditingController();
		nomeController = TextEditingController();
	}

	@override
	void dispose() {
		emailController.dispose();
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
                        controller: nomeController,
                        errorText: 'Digite um nome',
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
                      child: Text('Email'),
                    ),
                    Expanded(
                      child: InputField(
                        controller: emailController,
                        errorText: 'Digite um email',
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
                        controller: senhaController,
                        errorText: 'Digite uma senha',
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
                  text: 'Adicionar professor',
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      Map<String, dynamic> professorData = {
                        'email': emailController.text,
                        'senha': senhaController.text,
                        'nome': nomeController.text
                      };
                      await AdminService().criarProfessor(professorData);
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
