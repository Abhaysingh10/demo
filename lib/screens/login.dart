import 'package:easy_migration/resources/auth_methods.dart';
import 'package:easy_migration/screens/HomeScreen.dart';
import 'package:easy_migration/screens/forgot.dart';
import 'package:easy_migration/screens/signup.dart';
import 'package:easy_migration/utils/global_variables.dart';
import 'package:easy_migration/widgets/heading_label.dart';
import 'package:easy_migration/widgets/label.dart';
import 'package:easy_migration/widgets/text_field_input.dart';
import 'package:easy_migration/widgets/top_brown_box.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  Size size = WidgetsBinding.instance!.window.physicalSize;

  login() async {
    try {
      String res = await AuthMethods()
          .signIn(_emailController.text, _passwordController.text);
      if (res == "Success") {
        Navigator.push(context,
            MaterialPageRoute(builder: (builder) => const HomeScreen()));
        print("Login in successfully");
      }
      // ignore: empty_catches
    } catch (e) {}
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (Stack(
        children: [
          const TopBrownBox(),
          SingleChildScrollView(
            child: Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 5),
              child: SafeArea(
                bottom: true,
                child: Container(
                    //child: Text("This is new widget"),
                    width: MediaQuery.of(context).size.width,
                    //height: MediaQuery.of(context).size.height,

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
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const HeadingLabel(label: "Log-in"),
                        const SizedBox(height: 10.0),
                        const Label(labelText: 'Email'),
                        const SizedBox(height: 5.0),
                        TextFieldInput(
                            textEditingController: _emailController,
                            hintText: 'Your email id',
                            textInputType: TextInputType.emailAddress),
                        const SizedBox(height: 25.0),
                        const Label(labelText: 'Password'),
                        const SizedBox(height: 5.0),
                        TextFieldInput(
                            textEditingController: _passwordController,
                            hintText: 'Password',
                            textInputType: TextInputType.emailAddress,
                            isPass: true),
                        const SizedBox(height: largeheight / 4),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 1.125,
                            child: Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                    padding: const EdgeInsets.only(right: 30.0),
                                    child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (builder) =>
                                                      const ForgotPasswordScreen()));
                                        },
                                        child: const Text("Forget Password?",
                                            style: TextStyle(
                                                fontFamily: 'Comfortaa',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13.0,
                                                color: Colors.black)))))),
                        const SizedBox(height: largeheight / 4),
                        ElevatedButton(
                          onPressed: () {
                            login();
                          },
                          child: const Text(
                            "Login",
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
                        const SizedBox(height: smallheight),
                        SizedBox(

                            //width: MediaQuery.of(context).size.width / 1.125,
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account ?  ",
                              style: TextStyle(
                                  fontFamily: 'Comfortaa', fontSize: 13.0),
                            ),
                            TextButton(
                              child: const Text("Sign-up",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Comfortaa',
                                      fontWeight: FontWeight.w900,
                                      fontSize: 13.0)),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Signup()),
                                );
                              },
                            )
                          ],
                        )),
                        const SizedBox(height: largeheight / 2),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Expanded(
                                    child: Divider(
                                  color: Color(0XFF223843),
                                  thickness: 1,
                                )),
                                Text(
                                  " Or login with ",
                                  style: TextStyle(
                                      fontFamily: 'Comfortaa',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13.0),
                                ),
                                Expanded(
                                    child: Divider(
                                  color: Color(0XFF223843),
                                  thickness: 1,
                                )),
                              ]),
                        ),
                        const SizedBox(height: 15.0),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                child: IconButton(
                                  onPressed: () {
                                    signInWithGoogle();
                                  },
                                  icon: Image.asset("assets/icons/gmail.png"),
                                ),
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50.0)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black38,
                                          blurRadius: 30.0,
                                          offset: Offset(0, 15))
                                    ])),
                            const SizedBox(width: 30.0),
                            Container(
                                child: IconButton(
                                    onPressed: () {
                                      signInWithFacebook();
                                    },
                                    icon: Image.asset(
                                        "assets/icons/facebook.png"),
                                    iconSize: 10),
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50.0)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black38,
                                          blurRadius: 30.0,
                                          offset: Offset(0, 15))
                                    ])),
                          ],
                        ),
                        Container(height: 40.0)
                      ],
                    )),
              ),
            ),
          )
          // const IconBox(imagePath: "assets/icons/login.png")
        ],
      )),
    );
  }

  moveToSignup() {}
}
