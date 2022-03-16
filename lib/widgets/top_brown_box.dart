import 'package:flutter/material.dart';

class TopBrownBox extends StatelessWidget {
  const TopBrownBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/wallpapers/back3.jpg"),
              fit: BoxFit.fill)),
    );
  }
}
