import 'package:flutter/material.dart';
import 'package:atlas_citologico_fmabc/main.dart';
import '../services/admin.dart';
import '../services/professor.dart';
import '../widgets/button.dart';
import '../widgets/input_field.dart';

final Color darkBlue = Color(0xff002C53);
final Color lightGray = Color(0xffEBEBEB);
final Color green = Color(0xff009951);

class LoginTab extends StatelessWidget {
  final Function(TabType) onTap;
  LoginTab({super.key, required this.onTap});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  Future login(BuildContext context, String email, String senha) async {
    final int adminStatusCode = await AdminService().loginAdmin({
      'email_admin': email,
      'senha': senha,
    });

    final int professorStatusCode = await ProfessorService().loginProfessor({
      'email': email,
      'senha': senha,
    });

    if (adminStatusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
					backgroundColor: green,
          content: Text('Login realizado com sucesso.'),
          duration: Duration(seconds: 3),
        ),
      );
      return onTap(TabType.admin);
    }
    if (professorStatusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
					backgroundColor: green,
          content: Text('Login realizado com sucesso.'),
          duration: Duration(seconds: 3),
        ),
      );
      return print("Vai para telas do professor");
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
				backgroundColor: Colors.red,
        content: Text('Falha no login, email ou senha incorretos.'),
        duration: Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 2.5,
          height: MediaQuery.of(context).size.height / 1.5,
          decoration: BoxDecoration(
            color: lightGray,
            borderRadius: BorderRadius.circular(8),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(50),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 5,
                    children: <Widget>[
                      Text('Email:', style: TextStyle(fontSize: 20)),
                      InputField(
                        controller: emailController,
                        errorText: 'Por favor, insira um endereço de email',
                        labelText: 'Email',
                        width: 500,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black.withAlpha(50),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: darkBlue),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 5,
                    children: <Widget>[
                      Text('Senha:', style: TextStyle(fontSize: 20)),
                      InputField(
                        controller: senhaController,
                        errorText: 'Por favor, insira uma senha',
                        labelText: 'Senha',
                        width: 500,
                        obscureText: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black.withAlpha(50),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: darkBlue),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(60),
                  child: Button(
                    text: 'Fazer Login',
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        await login(
                          context,
                          emailController.text,
                          senhaController.text,
                        );
                      }
                    },
                    foregroundColor: Colors.white,
                    backgroundColor: green,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
