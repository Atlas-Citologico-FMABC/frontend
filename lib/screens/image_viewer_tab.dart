import 'package:flutter/material.dart';

final Color lightGray = Color(0xffEBEBEB);

class ImageViewerTab extends StatelessWidget {
  const ImageViewerTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Container(
				width: MediaQuery.of(context).size.width,
				constraints: BoxConstraints(
					minHeight: MediaQuery.of(context).size.height,
				),
        decoration: BoxDecoration(
          color: lightGray,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
        ),
				child: Text('Image Viewer'),
      ),
    );
  }
}
