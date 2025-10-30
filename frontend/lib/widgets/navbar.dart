import 'package:atlas_citologico_fmabc/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:atlas_citologico_fmabc/main.dart';

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
      child: AppBar(
        titleSpacing: 30,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        title: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Image.asset('assets/images/fmabc.png', height: 50),
        ),
        toolbarHeight: height,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: Button(
              text: 'Home',
              isSelected: selectedTab == TabType.home,
              selectedBackgroundColor: gray,
              onTap: () => onTapTab(TabType.home),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: Button(
              text: 'Diretórios',
              isSelected: selectedTab == TabType.diretorios || selectedTab == TabType.diretorio,
              selectedBackgroundColor: gray,
              onTap: () => onTapTab(TabType.diretorios),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: Button(
              text: 'Galeria',
              isSelected: selectedTab == TabType.galeria,
              selectedBackgroundColor: gray,
              onTap: () => onTapTab(TabType.galeria),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: Button(
              text: 'LOGIN',
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
              horizontalPadding: 60,
              onTap: () => onTapTab(TabType.login),
            ),
          ),
        ],
      ),
    ),
  );
}
