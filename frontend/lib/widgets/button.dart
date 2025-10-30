import 'package:flutter/material.dart';

Widget Button({
  required String text,
  final VoidCallback? onTap,
  bool isSelected = false,
  Color foregroundColor = Colors.black,
  Color backgroundColor = Colors.transparent,
  Color selectedBackgroundColor = Colors.grey,
  double horizontalPadding = 30,
  double verticalPadding = 25,
  double borderRadius = 8,
	double fontSize = 20,
	FontWeight fontWeight = FontWeight.normal,
}) {

  return TextButton(
    onPressed: onTap,
    style: TextButton.styleFrom(
      foregroundColor: foregroundColor,
      backgroundColor: isSelected ? selectedBackgroundColor : backgroundColor,
      textStyle: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    ),
    child: Text(text),
  );
}
