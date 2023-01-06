import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kumpool/controller/main_controller.dart';

class AppBottomBar extends StatelessWidget {
  const AppBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.find();

    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Ionicons.home_outline,
          ),
        )
      ],
      onTap: (index) => {},
    );
  }
}
