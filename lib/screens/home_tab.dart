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
          Container(
            width: double.infinity,
            color: darkBlue,
            padding: EdgeInsets.all(30),
            child: Column(
              children: <Widget>[
                if (isMobile(context)) 
                  Image.asset(
                    'assets/images/fmabc.png', 
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                if (isMobile(context)) SizedBox(height: 20),
                Text(
                  'FIMABC',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isMobile(context) ? 24 : 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Atlas de Citologia',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: isMobile(context) ? 32 : 45,
                  ),
                ),
                if (!isMobile(context)) Divider(color: Colors.white),
                if (!isMobile(context)) SizedBox(height: 40),
                if (!isMobile(context))
                  Text(
                    '<descrição do sistema>',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
              ],
            ),
          ),
          Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              color: darkBlue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.elliptical(700, 70),
                topRight: Radius.elliptical(700, 70),
              ),
            ),
            child: Container(
              margin: EdgeInsets.only(top: 50),
              decoration: BoxDecoration(
                color: lightGray,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.elliptical(700, 70),
                  topRight: Radius.elliptical(700, 70),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 70, right: 80, left: 80),
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