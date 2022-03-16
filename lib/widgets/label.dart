import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final String labelText;

  const Label({Key? key, required this.labelText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.35,
      child: Text(
        labelText,
        style: const TextStyle(
            fontFamily: 'Comfortaa',
            fontSize: 20.0,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
