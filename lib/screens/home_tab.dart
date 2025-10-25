import 'package:atlas_citologico_fmabc/widgets/diretorio_box.dart';
import 'package:flutter/material.dart';
import 'package:atlas_citologico_fmabc/main.dart';
import '../utils/responsiveness.dart';

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
          // SEÇÃO AZUL EM CIMA
          Container(
            width: double.infinity,
            color: darkBlue,
            padding: EdgeInsets.all(30),
            child: Column(
              children: <Widget>[
                Text(
                  'Atlas de Citologia',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: isMobile(context) ? 32 : 45,
                  ),
                ),
                Divider(color: Colors.white),
                SizedBox(height: isMobile(context) ? 40 : 100),
                Text(
                  isMobile(context) ? '<breve descrição do sistema>' : '<descrição do sistema>',
                  style: TextStyle(
                    color: Colors.white, 
                    fontSize: isMobile(context) ? 20 : 30
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          // SEÇÃO CINZA EMBAIXO
          Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              color: darkBlue,
              borderRadius: isMobile(context) 
                  ? BorderRadius.only( // CELULAR: CURVA PARA BAIXO
                      bottomLeft: Radius.elliptical(700, 70),
                      bottomRight: Radius.elliptical(700, 70),
                    )
                  : BorderRadius.only( // COMPUTADOR: CURVA PARA CIMA
                      topLeft: Radius.elliptical(700, 70),
                      topRight: Radius.elliptical(700, 70),
                    ),
            ),
            child: Container(
              margin: EdgeInsets.only(top: isMobile(context) ? 0 : 50),
              decoration: BoxDecoration(
                color: lightGray,
                borderRadius: isMobile(context)
                    ? BorderRadius.only( // CELULAR: CURVA PARA BAIXO
                        bottomLeft: Radius.elliptical(700, 70),
                        bottomRight: Radius.elliptical(700, 70),
                      )
                    : BorderRadius.only( // COMPUTADOR: CURVA PARA CIMA
                        topLeft: Radius.elliptical(700, 70),
                        topRight: Radius.elliptical(700, 70),
                      ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: isMobile(context) ? 40 : 70, 
                  right: isMobile(context) ? 20 : 80, 
                  left: isMobile(context) ? 20 : 80,
                  bottom: isMobile(context) ? 40 : 0
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        isMobile(context) ? 'Diretório Mais Utilizados:' : 'Diretórios mais usados:',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: isMobile(context) ? 24 : 30,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Wrap(
                      spacing: isMobile(context) ? 20 : 50,
                      runSpacing: isMobile(context) ? 15 : 30,
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
                    SizedBox(height: isMobile(context) ? 40 : 100),
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