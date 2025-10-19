import 'package:atlas_citologico_fmabc/screens/diretorios_tab.dart';
import 'package:atlas_citologico_fmabc/screens/galeria_tab.dart';
import 'package:atlas_citologico_fmabc/screens/home_tab.dart';
import 'package:atlas_citologico_fmabc/screens/login_tab.dart';
import 'package:atlas_citologico_fmabc/widgets/navbar.dart';
import 'package:flutter/material.dart';

import 'screens/admin_tab.dart';
import 'screens/diretorio_tab.dart';

enum TabType { home, diretorios, diretorio, galeria, login, admin }

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
				return DiretorioTab();
			case TabType.galeria:
				return GaleriaTab();
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
				body: getTab(selectedTab),
				backgroundColor: darkBlue,
			),
		);
	}
} 
