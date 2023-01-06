
import 'package:get/get.dart';
import 'package:kumpool/data/repository.dart';

class MainController extends GetxController{
  AppRepository repository = AppRepository();
  bool showBottomBar = false;

  void setShowBottomBarState(bool state){
    showBottomBar = state;
    update();
  }

  void checkLoginState(Function(bool) loginState){
    repository.checkLoginState(loginState);
  }

  void signOut(){
    repository.signOut();
  }
}