import 'package:flutter/material.dart';
import 'package:atlas_citologico_fmabc/main.dart';
import '../widgets/button.dart';
import '../widgets/input_field.dart';

final Color darkBlue = Color(0xff002C53);
final Color lightGray = Color(0xffEBEBEB);
final Color green = Color(0xff009951);

class LoginTab extends StatelessWidget {
  final Function(TabType) onTap;
  LoginTab({super.key, required this.onTap});

  final _formKey = GlobalKey<FormState>();

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
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        // onTap(TabType.admin);
                        onTap(TabType.profHome);
                        // onTap(TabType.profDiretorios);
                        // onTap(TabType.profGaleria);
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
