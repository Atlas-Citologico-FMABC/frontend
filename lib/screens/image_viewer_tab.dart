import 'package:flutter/material.dart';

import '../widgets/image_viewer_box.dart';

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
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              InkWell(
								onTap: () {},
                child: Row(
                  children: [
                    Icon(Icons.arrow_back, size: 24, color: green),
                    Text('Voltar', style: TextStyle(fontSize: 20, color: green)),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ImageViewerBox(
                        imagePath: 'assets/images/2000x1000.jpg', // test image
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
