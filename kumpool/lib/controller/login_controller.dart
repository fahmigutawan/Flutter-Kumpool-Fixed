import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:kumpool/data/repository.dart';

class LoginController extends GetxController {
  var repository = AppRepository();

  void signInWithGoogle(
    Function(UserCredential) onSuccess,
    Function(StackTrace) onFailed,
  ) {
    repository.signInWithGoogle(onSuccess, onFailed);
  }
}
