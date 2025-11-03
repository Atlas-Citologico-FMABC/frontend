import 'package:atlas_citologico_fmabc/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:atlas_citologico_fmabc/main.dart';
import 'package:atlas_citologico_fmabc/utils/responsiveness.dart'; //importando o ismobile

final Color gray = Color(0xFFEBEBEB);

PreferredSizeWidget NavBar({
  required double height,
  required TabType selectedTab,
  required Function(TabType) onTapTab,
}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(height),
    child: Padding(
      padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
      child: Builder(
        builder: (context) {
          // usamos o builder pois precisamos de um context válido para interagir com o Scaffold
          if (isMobile(context)) {
            // versão mobile: fundo azul, "bloquinho" central e PopupMenuButton (hamburger)
            return AppBar(
              backgroundColor: const Color(0xff002C53), // define a cor do fundo
              centerTitle: true, //centraliza o titulo
              elevation: 0, //remove a sombra
              titleSpacing: 0, //remove o espaco lateral do titulo
              shape: RoundedRectangleBorder(
                //bordas arredondadas
                borderRadius: BorderRadius.circular(8),
              ),
              title: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 30,
                  ),
                ),
              ),
              toolbarHeight: height, //altura da appbar
              actions: <Widget>[
                //itens do lado direito
                PopupMenuButton<TabType>(
                  constraints: BoxConstraints.tightFor(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 200,
                  ),
                  icon: const Icon(Icons.menu, color: Colors.white),
                  offset: Offset(
                    -MediaQuery.of(context).size.width *
                        0.1 ,0// move o menu pro centro
                  ),
                  onSelected: (TabType tab) {
                    onTapTab(tab);
                  },
                  itemBuilder: (BuildContext ctx) => <PopupMenuEntry<TabType>>[
                    const PopupMenuItem(
                      value: TabType.home,
                      child: Center(
                        child: Text(
                          'Home',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    const PopupMenuItem(
                      value: TabType.diretorios,
                      child: Center(
                        child: Text(
                          'Diretórios',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    const PopupMenuItem(
                      value: TabType.galeria,
                      child: Center(
                        child: Text(
                          'Galeria',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    const PopupMenuItem(
                      value: TabType.login,
                      child: Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }

          return AppBar(
            titleSpacing: 30,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            title: Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Image.asset('assets/images/fmabc.png', height: 50),
            ),
            toolbarHeight: height,
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 20,
                ),
                child: Button(
                  text: 'Home',
                  isSelected: selectedTab == TabType.home,
                  selectedBackgroundColor: gray,
                  onTap: () => onTapTab(TabType.home),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 20,
                ),
                child: Button(
                  text: 'Diretórios',
                  isSelected:
                      selectedTab == TabType.diretorios ||
                      selectedTab == TabType.diretorio,
                  selectedBackgroundColor: gray,
                  onTap: () => onTapTab(TabType.diretorios),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 20,
                ),
                child: Button(
                  text: 'Galeria',
                  isSelected: selectedTab == TabType.galeria,
                  selectedBackgroundColor: gray,
                  onTap: () => onTapTab(TabType.galeria),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 20,
                ),
                child: Button(
                  text: 'LOGIN',
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  horizontalPadding: 60,
                  onTap: () => onTapTab(TabType.login),
                ),
              ),
            ],
          );
        },
      ),
    ),
  );
}
