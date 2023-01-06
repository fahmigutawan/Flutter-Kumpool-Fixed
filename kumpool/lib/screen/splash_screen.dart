import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kumpool/controller/main_controller.dart';
import 'package:kumpool/main.dart';
import 'package:kumpool/navigation/nav_route.dart';
import 'package:kumpool/style/app_color.dart';
import '../style/app_font_style.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.find();

    Future.delayed(Duration(seconds: 3)).then(
      (value) {
        mainController.checkLoginState(
          (p0) {
            if (p0) {
              Get.offNamed(AppNavRoute.HomeScreen);
            } else {
              Get.offNamed(AppNavRoute.LoginScreen);
            }
          },
        );
      },
    );

    return Scaffold(
      body: Container(
        child: Center(
            child: Text(
          'Kumpool',
          style: AppFontStyle.H1.copyWith(color: AppColor.White),
        )),
        color: Colors.blueAccent,
        constraints: BoxConstraints.expand(),
      ),
    );
  }
}
