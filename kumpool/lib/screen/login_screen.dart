import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kumpool/controller/login_controller.dart';
import 'package:kumpool/style/app_font_style.dart';

import '../navigation/nav_route.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var padding = 32.0;

    return Scaffold(
      body: GetBuilder<LoginController>(
        init: LoginController(),
        builder: (controller) => Padding(
          padding: EdgeInsets.all(padding),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '2022. Created by Fahmi Noordin',
                    style: AppFontStyle.Body3,
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Kumpool',
                    style: AppFontStyle.H1,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Platform penyimpanan tugas yang fleksibel dan cocok untuk anda!',
                    style: AppFontStyle.Body1,
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: OutlinedButton(
                      onPressed: () => {
                        controller.signInWithGoogle(
                          (credential) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    'SUCCESS ${credential.user?.email.toString()}'),
                              ),
                            );

                            Future.delayed(Duration(seconds: 3)).then(
                              (value) {
                                Get.offNamed(AppNavRoute.HomeScreen);
                              },
                            );
                          },
                          (error) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('ERROR ${error}'),
                              ),
                            );
                          },
                        )
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'img/google_logo.png',
                            width: 24,
                            height: 24,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Text(
                              'Masuk dengan Google',
                              style: AppFontStyle.ButtonSmall,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
