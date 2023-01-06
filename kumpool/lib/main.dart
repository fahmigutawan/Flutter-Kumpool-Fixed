import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kumpool/controller/main_controller.dart';
import 'package:kumpool/navigation/nav_route.dart';
import 'package:kumpool/screen/home_screen.dart';
import 'package:kumpool/screen/login_screen.dart';
import 'package:kumpool/screen/splash_screen.dart';
import 'package:kumpool/widget/app_bottom_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bool showBottomBar = false;

    return MaterialApp(
      title: 'Kumpool',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GetBuilder<MainController>(
        init: MainController(),
        builder: (controller) => Scaffold(
          body: GetMaterialApp(
            initialRoute: AppNavRoute.SplashScreen,
            getPages: [
              GetPage(
                name: AppNavRoute.SplashScreen,
                page: () => SplashScreen(),
              ),
              GetPage(
                name: AppNavRoute.LoginScreen,
                page: () => LoginScreen(),
              ),
              GetPage(
                name: AppNavRoute.HomeScreen,
                page: () => HomeScreen(),
              ),
            ],
          ),
          bottomNavigationBar: controller.showBottomBar ? AppBottomBar() : null,
        ),
      ),
    );
  }
}
