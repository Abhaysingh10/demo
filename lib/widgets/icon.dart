import 'package:flutter/material.dart';
import 'dart:math' as math;

class IconBox extends StatelessWidget {
  final String imagePath;

  const IconBox({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 120, left: 210.0),
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(math.pi),
        child: Image(
          height: 230,
          image: AssetImage(imagePath),
        ),
      ),
    );
  }
}
