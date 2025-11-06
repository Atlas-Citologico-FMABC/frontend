import 'package:flutter/material.dart';

class FloatingRoundButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;

  const FloatingRoundButton({
    super.key,
    required this.onPressed,
    this.icon = Icons.add, // Ícone padrão
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      right: 20,
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: Colors.green, // verde
        shape: const CircleBorder(), // formato redondo
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}