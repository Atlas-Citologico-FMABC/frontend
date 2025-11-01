import 'package:flutter/material.dart';
import 'button.dart';
import 'input_field.dart';

final Color darkBlue = Color(0xff002C53);
final Color green = Color(0xff009951);

class EditDialog extends StatefulWidget {
  const EditDialog({super.key});

  @override
  State<EditDialog> createState() => _EditDialogState();
}

class _EditDialogState extends State<EditDialog> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nomeController = TextEditingController(
    text: 'user1',
  );
  final TextEditingController senhaController = TextEditingController(
    text: 'senha1',
  );

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
                        controller: senhaController,
                        errorText: 'Digite uma nova senha',
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
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      print(nomeController.text);
                      print(senhaController.text);
                      print('professor editado com sucesso');
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
