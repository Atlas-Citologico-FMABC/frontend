import 'package:atlas_citologico_fmabc/screens/diretorios_tab.dart';
import 'package:atlas_citologico_fmabc/screens/galeria_tab.dart';
import 'package:atlas_citologico_fmabc/screens/home_tab.dart';
import 'package:atlas_citologico_fmabc/screens/login_tab.dart';
import 'package:atlas_citologico_fmabc/widgets/navbar.dart';
import 'package:atlas_citologico_fmabc/screens/prof_home_tab.dart';
import 'package:atlas_citologico_fmabc/screens/prof_diretorios_tab.dart';
import 'package:atlas_citologico_fmabc/screens/prof_galeria_tab.dart';
import 'package:atlas_citologico_fmabc/widgets/prof_navbar.dart';
import 'package:flutter/material.dart';

import 'screens/admin_tab.dart';
import 'screens/diretorio_tab.dart';
import 'screens/prof_diretorio_tab.dart';
import 'screens/image_viewer_tab.dart';
import 'screens/prof_image_viewer_tab.dart';

enum NavBarType { normal, teacher }
enum TabType { home, diretorios, diretorio, galeria, imageViewer, login, admin, profHome, profDiretorios, profGaleria, profDiretorio, profImageViewer}

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
	NavBarType selectedNavBar = NavBarType.normal;
	TabType selectedTab = TabType.home;

	PreferredSizeWidget getNavBar(NavBarType navBar) {
		switch(navBar) {
			case NavBarType.normal:
				return NavBar(height: navHeight, selectedTab: selectedTab, onTapTab: onTapTab);
			case NavBarType.teacher:
				return profNavBar(height: navHeight, selectedTab: selectedTab, onTapTab: onTapTab);
		}
	}

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
        return LoginTab(switchNavBar: switchNavBar, onTap: onTapTab);
      case TabType.admin:
        return AdminTab();
      case TabType.profHome:
        return ProfHomeTab(navHeight: navHeight);
      case TabType.profDiretorios:
        return ProfDiretoriosTab(onTapDiretorio: onTapTab);
      case TabType.profGaleria:
        return ProfGaleriaTab();
      case TabType.profDiretorio:
        return ProfDiretorioTab(onTapImage: onTapTab);
      case TabType.profImageViewer:
        return ProfImageViewerTab();
    }
	}

	void switchNavBar(NavBarType navBarType) {
		setState(() => selectedNavBar = navBarType);
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
				appBar: getNavBar(selectedNavBar),
				body: getTab(selectedTab),
				backgroundColor: darkBlue,
			),
		);
	}
} 
