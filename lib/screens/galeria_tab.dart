import 'package:flutter/material.dart';
import '../widgets/image_box.dart';

final Color lightGray = Color(0xffEBEBEB);

class GaleriaTab extends StatelessWidget {
  const GaleriaTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            // height: MediaQuery.of(context).size.height - navHeight,
            // color: darkBlue,
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                Text(
                  'Atlas de Citologia - Galeria',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 45,
                  ),
                ),
                Divider(color: Colors.white),
                SizedBox(height: 30),
              ],
            ),
          ),
          Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              color: lightGray,
              borderRadius: BorderRadius.only(
                topLeft: Radius.elliptical(700, 70),
                topRight: Radius.elliptical(700, 70),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Wrap(
                    spacing: 50,
                    runSpacing: 50,
                    children: <Widget>[
											ImageBox(title: 'Image 1'),
											ImageBox(title: 'Image 2'),
											ImageBox(title: 'Image 3'),
											ImageBox(title: 'Image 4'),
											ImageBox(title: 'Image 5'),
											ImageBox(title: 'Image 6'),
											ImageBox(title: 'Image 7'),
											ImageBox(title: 'Image 8'),
											ImageBox(title: 'Image 9'),
											ImageBox(title: 'Image 10'),
											ImageBox(title: 'Image 11'),
											ImageBox(title: 'Image 12'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
