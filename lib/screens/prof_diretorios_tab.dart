import 'package:flutter/material.dart';
import '../widgets/diretorio_box.dart';
import '../widgets/floating_round_button.dart';
import '../main.dart';

final Color lightGray = const Color(0xffEBEBEB);

class ProfDiretoriosTab extends StatelessWidget {
  final Function(TabType) onTapDiretorio;
  const ProfDiretoriosTab({super.key, required this.onTapDiretorio});

  final String description =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.';

  String descriptionPreview(String description) {
    return description.length > 30
        ? description.substring(0, 30) + '...'
        : description + '...';
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              // TODO: restante do seu código permanece igual ao 'diretorio_tab'
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(30),
                child: const Column(
                  children: [
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
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.elliptical(700, 70),
                    topRight: Radius.elliptical(700, 70),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 70, horizontal: 80),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      Wrap(
                        spacing: 50,
                        runSpacing: 30,
                        children: [
                          Column(
                            children: [
                              DiretorioBox(
                                title: 'Diretório 1',
                                onTap: () =>
                                    onTapDiretorio(TabType.profDiretorio),
                              ),
                              const SizedBox(height: 10),
                              Text(descriptionPreview(description)),
                            ],
                          ),
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
        ),

        /// Botão verde no canto inferior direito
        FloatingRoundButton(
          onPressed: () {
            print("Botão pressionado!");
            // Coloque aqui a ação desejada, como abrir modal, criar diretório, etc.
          },
        ),
      ],
    );
  }
}
