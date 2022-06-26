import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentication {
  static SnackBar customSnackBar({required String content}) {
    return SnackBar(
      content: Text(
        content,
        style: TextStyle(
          color: Colors.redAccent,
          letterSpacing: 0.5,
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  static Future<User?> signInWithGoogle({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);
        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credintial') {
          ScaffoldMessenger.of(context).showSnackBar(
            Authentication.customSnackBar(
                content:
                    'The accnount already exixts with a different credential.'),
          );
        } else if (e.code == 'invalid-credintial') {}
      } catch (e) {}
    }
    return user;
  }

  static Future<void> signout({required BuildContext context}) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(Authentication.customSnackBar(
          content: 'Error signing out. Try again.'));
    }
  }
}
