import 'package:easy_migration/resources/auth_methods.dart';
import 'package:easy_migration/utils/global_variables.dart';
import 'package:easy_migration/widgets/heading_label.dart';
import 'package:easy_migration/widgets/label.dart';
import 'package:easy_migration/widgets/submission_button.dart';
import 'package:easy_migration/widgets/text_field_input.dart';
import 'package:easy_migration/widgets/top_brown_box.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _name = new TextEditingController();
  final TextEditingController _email = new TextEditingController();
  final TextEditingController _contact = new TextEditingController();
  final TextEditingController _password = new TextEditingController();
  // AuthMethods authMethods = new AuthMethods();

  up() async {
    print("Inside up method");
    String res = await AuthMethods().signUp(_email.text, _password.text);
    print(res);
    if (res == "Success") {
      print("Signup successfully done.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const TopBrownBox(),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: largeheight * 4),
              child: SafeArea(
                  child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    //  color: Colors.white,
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Colors.white, Colors.blueGrey]),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0))),
                child: Column(
                  children: [
                    const HeadingLabel(label: "Sign-up"),
                    const SizedBox(height: largeheight),
                    const Label(labelText: "Name"),
                    const SizedBox(height: smallheight),
                    TextFieldInput(
                        textEditingController: _name,
                        hintText: "Your name",
                        textInputType: TextInputType.text),
                    const SizedBox(height: largeheight),
                    const Label(labelText: "Email"),
                    const SizedBox(height: smallheight),
                    TextFieldInput(
                        textEditingController: _email,
                        hintText: "Email",
                        textInputType: TextInputType.emailAddress),
                    const SizedBox(height: largeheight),
                    const Label(labelText: "Contact No."),
                    const SizedBox(height: smallheight),
                    TextFieldInput(
                        textEditingController: _contact,
                        hintText: "Your contact no.",
                        textInputType: TextInputType.phone),
                    const SizedBox(height: largeheight),
                    const Label(labelText: "Password"),
                    const SizedBox(height: smallheight),
                    TextFieldInput(
                      textEditingController: _password,
                      hintText: "Password",
                      textInputType: TextInputType.emailAddress,
                      isPass: true,
                    ),
                    const SizedBox(height: largeheight),
                    ElevatedButton(
                      onPressed: () {
                        up();
                      },
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                            fontFamily: 'Comfortaa',
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0XFF223843),
                          fixedSize: const Size(250, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0))),
                    ),
                    const SizedBox(height: largeheight * 2)
                  ],
                ),
              )),
            ),
          )
        ],
      ),
    );
  }
}
