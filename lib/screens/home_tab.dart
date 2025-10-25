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
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          // PRIMEIRA SEÇÃO - FUNDO CINZA COM BORDA INFERIOR AZUL
          Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height * 0.6,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              color: lightGray,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(700, 70),
                bottomRight: Radius.elliptical(700, 70),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 70, right: 80, left: 80, bottom: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Diretórios mais usados:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
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
                ],
              ),
            ),
          ),
          
          // SEGUNDA SEÇÃO - FUNDO AZUL COM TEXTO
          Container(
            width: double.infinity,
            color: darkBlue,
            padding: EdgeInsets.all(40),
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
                SizedBox(height: 40),
                Text(
                  '<breve descrição do sistema>',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}