import 'package:atlas_citologico_fmabc/screens/diretorios_tab.dart';
import 'package:atlas_citologico_fmabc/screens/galeria_tab.dart';
import 'package:atlas_citologico_fmabc/screens/home_tab.dart';
import 'package:atlas_citologico_fmabc/screens/login_tab.dart';
import 'package:atlas_citologico_fmabc/widgets/navbar.dart';
import 'package:atlas_citologico_fmabc/screens/prof_home_tab.dart';
import 'package:atlas_citologico_fmabc/screens/prof_diretorios_tab.dart';
import 'package:atlas_citologico_fmabc/screens/prof_galeria_tab.dart';
import 'package:flutter/material.dart';

import 'screens/admin_tab.dart';
import 'screens/diretorio_tab.dart';
import 'screens/image_viewer_tab.dart';

enum Mode {normal, professor, admin}
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
  Mode currentMode = Mode.normal;
	TabType selectedTab = TabType.home;

	Widget getTab(TabType tab) {
    if (currentMode == Mode.professor) {
      switch(tab) {
        case TabType.home:
          return ProfHomeTab(navHeight: navHeight);
        case TabType.diretorios:
          return ProfDiretoriosTab(onTapDiretorio: onTapTab);
        case TabType.diretorio:
          return DiretorioTab(onTapImage: onTapTab);
        case TabType.galeria:
          return ProfGaleriaTab(onTapImage: onTapTab);
        case TabType.imageViewer:
          return ImageViewerTab();
        case TabType.login:
          return LoginTab(onTap: onTapTab);
        case TabType.admin:
          return AdminTab();
      }
    }
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
				appBar: NavBar(height: navHeight, selectedTab: selectedTab, onTapTab: onTapTab),
        // appBar: profNavBar(height: height, selectedTab: selectedTab, onTapTab: onTapTab)
				body: getTab(selectedTab),
				backgroundColor: darkBlue,
			),
		);
	}
} 
