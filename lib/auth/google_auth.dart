// ignore_for_file: avoid_print

import 'package:get_topik_korean_quiz/tools/file_importer.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseServices {
  final auth = FirebaseAuth.instance;
  final googleSignIN = GoogleSignIn();

  signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIN.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        await auth.signInWithCredential(authCredential);
      }
    } on FirebaseAuthException catch (e) {
      print(
        e.toString(),
      );
    }
  }

  //LOG OUT
  googleSignOut() async {
    await googleSignIN.signOut();
  }
}
