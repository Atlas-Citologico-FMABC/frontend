import 'package:flutter/material.dart';
import '../main.dart';
import '../widgets/diretorio_box.dart';

final Color lightGray = Color(0xffEBEBEB);

import '../widgets/diretorio_box.dart';

class DiretoriosTab extends StatelessWidget {
  final Function(TabType) onTapDiretorio;
  const DiretoriosTab({super.key, required this.onTapDiretorio});

  @override
  Widget build(BuildContext context) {
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
                  'Atlas de Citologia - Diretórios',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 45,
                  ),
                ),
                Divider(color: Colors.white),
                SizedBox(height: 30),
              ],
            ),
          ),
          Container(
<<<<<<< HEAD
						constraints: BoxConstraints(
							minHeight: MediaQuery.of(context).size.height,
						),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
=======
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              color: lightGray,
>>>>>>> 2e573565129a7122dd34170d0767f04cc523c653
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
                  SizedBox(height: 20),
                  Wrap(
                    spacing: 50,
                    runSpacing: 30,
                    children: <Widget>[
<<<<<<< HEAD
                      DiretorioBox(title: 'Diretório 1'),
=======
                      DiretorioBox(title: 'Diretório 1', onTap: () => onTapDiretorio(TabType.diretorio)),
>>>>>>> 2e573565129a7122dd34170d0767f04cc523c653
                      DiretorioBox(title: 'Diretório 2'),
                      DiretorioBox(title: 'Diretório 3'),
                      DiretorioBox(title: 'Diretório 4'),
                      DiretorioBox(title: 'Diretório 5'),
                      DiretorioBox(title: 'Diretório 6'),
                      DiretorioBox(title: 'Diretório 7'),
                      DiretorioBox(title: 'Diretório 8'),
                      DiretorioBox(title: 'Diretório 9'),
                      DiretorioBox(title: 'Diretório 10'),
                      DiretorioBox(title: 'Diretório 11'),
                      DiretorioBox(title: 'Diretório 12'),
                      DiretorioBox(title: 'Diretório 13'),
                      DiretorioBox(title: 'Diretório 14'),
                      DiretorioBox(title: 'Diretório 15'),
                      DiretorioBox(title: 'Diretório 16'),
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
}
