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
          //usamoso builder pois estamos usando o drawer
          if (isMobile(context)) {
            //verifica se a tela eh mobile <768
            return AppBar(
              titleSpacing: 0, //espacamento horizontal
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ), //aplica cantos arredondados
              title: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                ), //aplica 10 pixels de espaçamento (em cima e embaixo)
                child: Image.asset('assets/images/fmabc.png', height: 40),
              ),
              toolbarHeight:
                  height, //altura da tollbar - (barra superior da interfafe, q contem titulo, botao de nav e acoes)
              actions: <Widget>[
                //lista de widgets q mostra na direita
                IconButton(
                  //botao usado para item de acao
                  icon: const Icon(
                    Icons.menu,
                  ), //hamburguer - const usado para otimização
                  onPressed: () {
                    Scaffold.of(
                      context,
                    ).openDrawer(); // faz o menu lateral aparecer
                  },
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
