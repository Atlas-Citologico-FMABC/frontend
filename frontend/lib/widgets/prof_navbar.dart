import 'package:atlas_citologico_fmabc/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:atlas_citologico_fmabc/main.dart';

import '../utils/responsiveness.dart';

final Color green = Color(0xff009951);
final Color gray = Color(0xFFEBEBEB);

PreferredSizeWidget profNavBar({
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
          if (isMobile(context)) {
            return AppBar(
              backgroundColor: darkBlue,
              titleSpacing: 30,
              title: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Image.asset('assets/images/fmabc.png', height: 50),
              ),
              toolbarHeight: height,
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20, right: 8, bottom: 20),
                  child: PopupMenuButton<TabType>(
                    tooltip: '',
                    constraints: BoxConstraints.tightFor(
                      width: MediaQuery.of(context).size.width * 0.8,
                    ),
                    icon: const Icon(Icons.menu, size: 30, color: Colors.white),
                    offset: Offset(-MediaQuery.of(context).size.width * 0.1, 0),
                    onSelected: (TabType tab) {
                      onTapTab(tab);
                    },
                    itemBuilder: (BuildContext ctx) =>
                        <PopupMenuEntry<TabType>>[
                          const PopupMenuItem(
                            value: TabType.profHome,
                            child: Center(
                              child: Text(
                                'Home',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          const PopupMenuItem(
                            value: TabType.profDiretorios,
                            child: Center(
                              child: Text(
                                'Diretórios',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          const PopupMenuItem(
                            value: TabType.profGaleria,
                            child: Center(
                              child: Text(
                                'Galeria',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          PopupMenuItem(
                            child: Center(
                              child: Container(
                                width: 120,
                                height: 40,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Text(
                                  'SAIR',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                  ),
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
                  isSelected: selectedTab == TabType.profHome,
                  selectedBackgroundColor: gray,
                  onTap: () => onTapTab(TabType.profHome),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 20,
                ),
                child: Button(
                  text: 'Diretórios',
                  isSelected: selectedTab == TabType.profDiretorios,
                  selectedBackgroundColor: gray,
                  onTap: () => onTapTab(TabType.profDiretorios),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 20,
                ),
                child: Button(
                  text: 'Galeria',
                  isSelected: selectedTab == TabType.profGaleria,
                  selectedBackgroundColor: gray,
                  onTap: () => onTapTab(TabType.profGaleria),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 20,
                ),
                child: Button(
                  text: 'Logado',
                  foregroundColor: Colors.white,
                  backgroundColor: green,
                  horizontalPadding: 60,
                  onTap: () {},
                ),
              ),
            ],
          );
        },
      ),
    ),
  );
}
