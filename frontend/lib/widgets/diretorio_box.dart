import 'package:flutter/material.dart';

Widget DiretorioBox({
  required String title,
	final VoidCallback? onTap,
  double borderWidth = 0,
  Color borderColor = Colors.transparent,
}) {
  return InkWell(
		onTap: onTap,
    child: Container(
      width: 300,
      height: 170,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.7),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 5),
          ),
        ],
        color: Colors.white,
        border: Border.all(color: borderColor, width: borderWidth),
        borderRadius: BorderRadiusGeometry.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(alignment: Alignment.bottomLeft, child: Text(title)),
      ),
    ),
  );
}
