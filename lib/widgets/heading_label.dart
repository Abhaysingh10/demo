import 'package:flutter/material.dart';

class HeadingLabel extends StatelessWidget {
  final String label;
  const HeadingLabel({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 30,
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.125,
        height: MediaQuery.of(context).size.height * 0.12,
        child: Text(
          label,
          style: const TextStyle(
              fontSize: 40.0,
              fontFamily: 'Comfortaa',
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
