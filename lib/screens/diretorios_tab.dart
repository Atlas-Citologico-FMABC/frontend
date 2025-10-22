import 'package:flutter/material.dart';
import '../main.dart';
import '../widgets/diretorio_box.dart';

final Color lightGray = Color(0xffEBEBEB);

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
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              color: lightGray,
            ), // ← CORRIGIDO: fechamento correto
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
                      DiretorioBox(title: 'Diretório 1', onTap: () => onTapDiretorio(TabType.diretorio)),
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