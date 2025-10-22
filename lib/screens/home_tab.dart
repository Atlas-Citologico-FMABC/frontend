import 'package:atlas_citologico_fmabc/widgets/diretorio_box.dart';
import 'package:flutter/material.dart';
import 'package:atlas_citologico_fmabc/main.dart';

final Color darkBlue = Color(0xff002C53);
final Color lightGray = Color(0xffEBEBEB);
final Color green = Color(0xff009951);

class HomeTab extends StatelessWidget {
  final double navHeight;
  const HomeTab({super.key, required this.navHeight});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Container azul (fundo)
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4, // 40% da tela
            color: darkBlue,
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                children: <Widget>[
                  Text(
                    'Atlas de Citologia',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 45,
                    ),
                  ),
                  Divider(color: Colors.white),
                  SizedBox(height: 30),
                  Text(
                    '<descrição do sistema>',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          
          // Container branco com borda (sobreposto)
          Positioned(
            top: MediaQuery.of(context).size.height * 0.3, // Começa no 30% da tela
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: lightGray,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.elliptical(700, 70),
                  topRight: Radius.elliptical(700, 70),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 100, right: 80, left: 80),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Diretórios mais usados:',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    SizedBox(height: 20),
                    Wrap(
                      spacing: 50,
                      runSpacing: 30,
                      children: <Widget>[
                        DiretorioBox(
                          title: 'Diretório 1',
                          borderWidth: 5,
                          borderColor: green,
                        ),
                        DiretorioBox(
                          title: 'Diretório 2',
                          borderWidth: 5,
                          borderColor: green,
                        ),
                        DiretorioBox(
                          title: 'Diretório 3',
                          borderWidth: 5,
                          borderColor: green,
                        ),
                        DiretorioBox(
                          title: 'Diretório 4',
                          borderWidth: 5,
                          borderColor: green,
                        ),
                      ],
                    ),
                    SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}