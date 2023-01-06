import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AppRepository {
  //SignIn with google
  void signInWithGoogle(
    Function(UserCredential) onSuccess,
    Function(StackTrace) onFailed,
  ) async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential).then(
          (value) => onSuccess(value),
          onError: (stackTrace) => onFailed(stackTrace),
        );
  }

  //Check login state
  void checkLoginState(Function(bool) loginState) {
    FirebaseAuth.instance.currentUser == null
        ? loginState(false)
        : loginState(true);
  }

  //logout
  void signOut(){
    FirebaseAuth.instance.signOut();
  }
}
