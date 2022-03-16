import 'package:easy_migration/screens/login.dart';
import 'package:easy_migration/utils/global_variables.dart';
import 'package:easy_migration/widgets/heading_label.dart';
import 'package:easy_migration/widgets/label.dart';
import 'package:easy_migration/widgets/submission_button.dart';
import 'package:easy_migration/widgets/text_field_input.dart';
import 'package:easy_migration/widgets/top_brown_box.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _email = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      const TopBrownBox(),
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 225.0),
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
                const HeadingLabel(label: "Forgot Password"),
                const SizedBox(height: largeheight),
                const Label(labelText: "Email"),
                const SizedBox(height: smallheight),
                TextFieldInput(
                    textEditingController: _email,
                    hintText: "Your email id",
                    textInputType: TextInputType.emailAddress),
                const SizedBox(height: largeheight),
                const SubmissionButton(buttonLabel: "Submit"),
                Container(
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Expanded(
                            child: Divider(
                          color: Colors.white,
                          // color: Color(0XFF223843),
                          thickness: 1,
                        )),
                        TextButton(
                          child: const Text("Back to login",
                              style: TextStyle(
                                  fontFamily: 'Comfortaa',
                                  fontWeight: FontWeight.w900,
                                  fontSize: 13.0,
                                  color: Colors.black)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()),
                            );
                          },
                        ),
                        const Expanded(
                            child: Divider(
                          color: Colors.white,
                          // color: Color(0XFF223843),
                          thickness: 1,
                        )),
                      ]),
                ),
                SizedBox(height: MediaQuery.of(context).size.height)
              ],
            ),
          ),
        ),
      )
    ]));
  }
}
