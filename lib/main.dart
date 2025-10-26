import 'package:atlas_citologico_fmabc/screens/diretorios_tab.dart';
import 'package:atlas_citologico_fmabc/screens/galeria_tab.dart';
import 'package:atlas_citologico_fmabc/screens/home_tab.dart';
import 'package:atlas_citologico_fmabc/screens/login_tab.dart';
import 'package:atlas_citologico_fmabc/widgets/navbar.dart';
import 'package:flutter/material.dart';

import 'screens/admin_tab.dart';
import 'screens/diretorio_tab.dart';
import 'screens/image_viewer_tab.dart';

enum TabType { home, diretorios, diretorio, galeria, imageViewer, login, admin }

final Color darkBlue = Color(0xff002C53);
const double navHeight = 100;

void main() {
  runApp(const MainPage());
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TabType selectedTab = TabType.home;

  Widget getTab(TabType tab) {
    switch(tab) {
      case TabType.home:
        return HomeTab(navHeight: navHeight);
      case TabType.diretorios:
        return DiretoriosTab(onTapDiretorio: onTapTab);
      case TabType.diretorio:
        return DiretorioTab(onTapImage: onTapTab);
      case TabType.galeria:
        return GaleriaTab();
      case TabType.imageViewer:
        return ImageViewerTab();
      case TabType.login:
        return LoginTab(onTap: onTapTab);
      case TabType.admin:
        return AdminTab();
    }
  }

  void onTapTab(TabType tab) {
    setState(() => selectedTab = tab);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Atlas de Citologia',
      home: Scaffold(
        appBar: NavBar(  
          height: navHeight,
          selectedTab: selectedTab, 
          onTapTab: onTapTab,
        ),
        endDrawer: Drawer(
          child: Container(
            color: Colors.transparent, // FUNDO TRANSPARENTE
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: EdgeInsets.only(top: 80, right: 20),
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildMenuItem('Home', TabType.home),
                    _buildMenuItem('Diretórios', TabType.diretorios),
                    _buildMenuItem('Galeria', TabType.galeria),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: getTab(selectedTab),
        backgroundColor: darkBlue,
      ),
    ); 
  }

  Widget _buildMenuItem(String text, TabType tab) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          onTapTab(tab);
          Navigator.pop(context);
        },
        splashColor: darkBlue.withOpacity(0.1),
        highlightColor: darkBlue.withOpacity(0.2),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}