import 'package:flutter/material.dart';

Widget InputField({
	TextEditingController? controller,
  required String errorText,
  double width = 400,
  double height = 2,
  double fontSize = 20,
  bool obscureText = false,
  String? labelText,
  double borderRadius = 8,
  InputBorder? enabledBorder,
  InputBorder? focusedBorder,
}) {
  return SizedBox(
    width: width,
    child: TextFormField(
			controller: controller,
      style: TextStyle(fontSize: fontSize, height: height),
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        labelText: labelText,
        floatingLabelStyle: TextStyle(color: Colors.green),
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errorText;
        }
        return null;
      },
    ),
  );
}
