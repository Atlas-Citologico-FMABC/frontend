import 'package:atlas_citologico_fmabc/widgets/button.dart';
import 'package:flutter/material.dart';

final Color darkBlue = Color(0xff002C53);
final Color gray = Color(0xFFEBEBEB);

PreferredSizeWidget adminNavBar({
  required double height,
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
              text: 'SAIR',
              foregroundColor: Colors.white,
              backgroundColor: Colors.red,
              horizontalPadding: 50,
              onTap: () {},
            ),
          ),
        ],
      ),
    ),
  );
}
