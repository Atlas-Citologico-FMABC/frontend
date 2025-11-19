import 'package:flutter/material.dart';

import '../widgets/image_canvas.dart';
import '../widgets/image_viewer_box.dart';

final Color lightGray = Color(0xffEBEBEB);

class ImageViewerTab extends StatelessWidget {
	final String imageFolderName;
  const ImageViewerTab({super.key, required this.imageFolderName});

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
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Icon(Icons.arrow_back, size: 24, color: green),
                    Text(
                      'Voltar',
                      style: TextStyle(fontSize: 20, color: green),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: BoxBorder.all(color: green, width: 3),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
												child: ImageCanvas(),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: lightGray,
                          child: Center(
                            child: Text('<descrição da imagem>'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
