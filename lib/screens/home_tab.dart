import 'package:atlas_citologico_fmabc/widgets/diretorio_box.dart';
import 'package:flutter/material.dart';
import 'package:atlas_citologico_fmabc/utils/responsiveness.dart';

final Color darkBlue = Color(0xff002C53);
final Color lightGray = Color(0xffEBEBEB);
final Color green = Color(0xff009951);

class HomeTab extends StatelessWidget {
  final double navHeight;
  const HomeTab({super.key, required this.navHeight});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (isMobile(context)) {
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  color: darkBlue,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/fmabc.png',
                        height: 80,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Atlas de Citologia',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Divider(color: Colors.white),
                      const SizedBox(height: 40),
                      const Text(
                        '<descrição do sistema>',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: lightGray,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.elliptical(700, 70),
                      topRight: Radius.elliptical(700, 70),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 40,
                      horizontal: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Diretórios mais usados:',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Wrap(
                          spacing: 20,
                          runSpacing: 20,
                          alignment: WrapAlignment.center,
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
              ],
            ),
          );
        }
    
      return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            // height: MediaQuery.of(context).size.height - navHeight,
            // color: darkBlue,
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
                SizedBox(height: 100),
                Text(
                  '<descrição do sistema>',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            constraints: BoxConstraints(
              minHeight:
                  MediaQuery.of(context).size.height -
                  383, // -383 just for tests
            ),
            decoration: BoxDecoration(
              color: lightGray,
              borderRadius: BorderRadius.only(
                topLeft: Radius.elliptical(700, 70),
                topRight: Radius.elliptical(700, 70),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 80),
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }, 
    );
  } 
} 