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
import 'package:google_fonts/google_fonts.dart';

import 'screens/admin_tab.dart';
import 'screens/diretorio_tab.dart';
import 'screens/prof_diretorio_tab.dart';
import 'screens/image_viewer_tab.dart';
import 'screens/prof_image_viewer_tab.dart';
import 'widgets/admin_navbar.dart';

enum NavBarType { normal, teacher, admin }
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
	String? currImageFolderName; // imagem referente a imagem clicada na galeria
	TabType? currBackTab;

	List<String>? currImageFolderNames; // apenas as imagens referentes a certo diretorio
	String? diretorioTitle, diretorioDescription;

	NavBarType selectedNavBar = NavBarType.normal;
	TabType selectedTab = TabType.home;

	void onLogout() {
		setState(() {
			selectedNavBar = NavBarType.normal;
			selectedTab = TabType.login;
		});
	}

	void onBack(TabType backTab) {
		currBackTab = backTab;
		setState(() =>
			selectedTab = currBackTab!,
		);
		print(currImageFolderName);
	}

	void openImageViewer(String imageFolderName, TabType backTab) {
		currImageFolderName = imageFolderName;
		currBackTab = backTab;
		setState(() =>
			selectedTab = TabType.imageViewer,
		);
		print(currImageFolderName);
	}

	void openTeacherImageViewer(String imageFolderName) {
		currImageFolderName = imageFolderName;
		setState(() =>
			selectedTab = TabType.profImageViewer,
		);
		print(currImageFolderName);
	}

	void openDirectory(List<String> imageFolderNames, {String? title, String? description}) {
		setState(() {
			currImageFolderNames = imageFolderNames;
			diretorioTitle = title;
			diretorioDescription = description;
			selectedTab = TabType.diretorio;
		});
	}

	void openTeacherDirectory(List<String> imageFolderNames, {String? title, String? description}) {
		setState(() {
			currImageFolderNames = imageFolderNames;
			diretorioTitle = title;
			diretorioDescription = description;
			selectedTab = TabType.profDiretorio;
		});
	}

	PreferredSizeWidget getNavBar(NavBarType navBar) {
		switch(navBar) {
			case NavBarType.normal:
				return NavBar(height: navHeight, selectedTab: selectedTab, onTapTab: onTapTab);
			case NavBarType.teacher:
				return profNavBar(height: navHeight, selectedTab: selectedTab, onTapTab: onTapTab, onLogout: onLogout);
			case NavBarType.admin:
				return adminNavBar(height: navHeight, onLogout: onLogout);
		}
	}

	Widget getTab(TabType tab) {
    switch(tab) {
      case TabType.home:
        return HomeTab(navHeight: navHeight);
      case TabType.diretorios:
        return DiretoriosTab(openDirectory: openDirectory);
      case TabType.diretorio:
        return DiretorioTab(onTapImage: openImageViewer, folderNames: currImageFolderNames, title: diretorioTitle, description: diretorioDescription);
      case TabType.galeria:
        return GaleriaTab(openImageViewer: openImageViewer);
      case TabType.imageViewer:
        return ImageViewerTab(backTab: currBackTab!, onBack: onBack, imageFolderName: currImageFolderName!);
      case TabType.login:
        return LoginTab(switchNavBar: switchNavBar, onTap: onTapTab);
      case TabType.admin:
        return AdminTab();
      case TabType.profHome:
        return ProfHomeTab(navHeight: navHeight);
      case TabType.profDiretorios:
        return ProfDiretoriosTab(openTeacherDirectory: openTeacherDirectory);
      case TabType.profGaleria:
        return ProfGaleriaTab(openTeacherImageViewer: openTeacherImageViewer);
      case TabType.profDiretorio:
        return ProfDiretorioTab(onTapImage: openTeacherImageViewer, folderNames: currImageFolderNames, title: diretorioTitle, description: diretorioDescription);
      case TabType.profImageViewer:
        return ProfImageViewerTab(imageFolderName: currImageFolderName!);
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
			theme: ThemeData(
				fontFamily: GoogleFonts.inter().fontFamily,
			),
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
