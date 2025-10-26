import 'package:atlas_citologico_fmabc/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:atlas_citologico_fmabc/main.dart';
import '../utils/responsiveness.dart';

final Color gray = Color(0xFFEBEBEB);

PreferredSizeWidget NavBar({
  required double height,
  required TabType selectedTab,
  required Function(TabType) onTapTab,
  bool showImageOnRight = false, // NOVO PARÂMETRO
}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(height),
    child: Padding(
      padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
      child: Builder(
        builder: (context) => AppBar(
          backgroundColor: isMobile(context) ? Colors.transparent : Colors.white,
          elevation: isMobile(context) ? 0 : 4,
          titleSpacing: 30,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: isMobile(context) 
              ? (showImageOnRight 
                  ? null // Imagem vai para actions no mobile
                  : null) // SEM IMAGEM no mobile padrão
              : Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Image.asset('assets/images/fmabc.png', height: 50),
                ),
          toolbarHeight: height,
          automaticallyImplyLeading: false,
          leading: null,
          actions: <Widget>[
            if (isMobile(context) && showImageOnRight) ...[
              // IMAGEM NO LADO DIREITO PARA MOBILE
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Image.asset('assets/images/fmabc.png', height: 40),
              ),
              SizedBox(width: 10),
            ],
            if (isMobile(context)) ...[
              Builder(
                builder: (context) => IconButton(
                  icon: Icon(Icons.menu, color: Colors.white, size: 30),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                ),
              ),
            ],
            if (!isMobile(context)) ...[
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
          ],
        ),
      ),
    ),
  );
}