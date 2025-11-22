import 'package:atlas_citologico_fmabc/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:atlas_citologico_fmabc/main.dart';

import '../utils/responsiveness.dart';

final Color darkBlue = Color(0xff002C53);
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
                    offset: Offset(
                      -MediaQuery.of(context).size.width * 0.1,
                      0,
                    ),
                    onSelected: (TabType tab) {
                      onTapTab(tab);
                    },
                    itemBuilder: (BuildContext ctx) => <PopupMenuEntry<TabType>>[
                      const PopupMenuItem(
                        value: TabType.home,
                        child: Center(
                          child: Text('Home', style: TextStyle(fontSize: 20)),
                        ),
                      ),
                      const PopupMenuItem(
                        value: TabType.diretorios,
                        child: Center(
                          child: Text(
                            'Diretórios',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      const PopupMenuItem(
                        value: TabType.galeria,
                        child: Center(
                          child: Text('Galeria', style: TextStyle(fontSize: 20)),
                        ),
                      ),
                      PopupMenuItem(
                        value: TabType.login,
                        child: Center(
                          child: Container(
                            width: 120,
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(
                                8,
                              ),
                            ),
                            child: const Text(
                              'LOGIN',
                              style: TextStyle(
                                color: Colors.white,
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
