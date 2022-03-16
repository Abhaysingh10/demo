import 'package:flutter/material.dart';

class SubmissionButton extends StatelessWidget {
  final String buttonLabel;
  const SubmissionButton({Key? key, required this.buttonLabel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        buttonLabel,
        style: const TextStyle(
            fontFamily: 'Comfortaa',
            fontSize: 20.0,
            fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
          primary: const Color(0XFF223843),
          fixedSize: const Size(250, 50),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0))),
    );
  }
}
