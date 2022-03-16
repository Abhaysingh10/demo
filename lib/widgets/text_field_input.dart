import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;

  const TextFieldInput(
      {Key? key,
      required this.textEditingController,
      required this.hintText,
      this.isPass = false,
      required this.textInputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      borderSide: Divider.createBorderSide(context, color: Colors.red),
    );

    return Container(
      width: MediaQuery.of(context).size.width / 1.35,
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0XFF93a0c0))),
          hintText: hintText,
          hintStyle: const TextStyle(
              fontSize: 12.0,
              fontFamily: 'Comfortaa',
              fontWeight: FontWeight.bold,
              color: Color(0XFF223843)),
          // border: inputBorder,
          //  focusedBorder: inputBorder,
          filled: false,
          contentPadding: const EdgeInsets.all(0),
        ),
        keyboardType: textInputType,
        obscureText: isPass,
      ),
    );
  }
}
