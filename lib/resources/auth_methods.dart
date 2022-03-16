import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  FirebaseAuth auth = FirebaseAuth.instance;
//signing up

  Future<String> signUp(String email, String password) async {
    try {
      print(email);
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return "Success";
    } on Exception catch (e) {
      return e.toString();
    }
  }

//signing in

  Future<String> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return "Success";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return "Wrong password provided for that user ";
      }
    }

    return '';
  }
}
