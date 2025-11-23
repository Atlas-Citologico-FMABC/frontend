import 'package:flutter/material.dart';

class FloatingRoundButton extends StatelessWidget {
  final VoidCallback onPressed;
	final double? top;
	final double right;
	final double bottom;
	final double? left;
	final double? width;
	final double? height;
	final Color backgroundColor;
  final IconData icon;
	final Color iconColor;

  const FloatingRoundButton({
    super.key,
    required this.onPressed,
		this.top,
		this.right = 20,
		this.bottom = 20,
		this.left,
		this.width,
		this.height,
		this.backgroundColor = Colors.green,
    this.icon = Icons.add,
		this.iconColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
			top: top,
      right: right,
      bottom: bottom,
			left: left,
			width: width,
			height: height,
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: backgroundColor,
        shape: const CircleBorder(), // formato redondo
        child: Icon(icon, color: iconColor),
      ),
    );
  }
}
