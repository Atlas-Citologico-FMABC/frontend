import 'package:flutter/material.dart';

final Color green = Color(0xff009951);

class ImageViewerBox extends StatelessWidget {
  final String imagePath;
  const ImageViewerBox({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
			height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      clipBehavior: Clip.hardEdge,
      child: InteractiveViewer(
        minScale: 1,
        maxScale: 50,
        boundaryMargin: const EdgeInsets.all(double.infinity),
        child: Image.asset(
          imagePath,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
