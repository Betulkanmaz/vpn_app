import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_app/controller/bottom_bar_controller.dart';
import 'package:vpn_app/controller/home_controller.dart';
import 'package:vpn_app/resources/app_colors.dart';
import 'package:vpn_app/view/widgets/bottom_bar.dart';

void main() {
  Get.put(BottomBarController());
  Get.put(HomeController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VPN App Case',
      home: BottomBar(),
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: homeController.isDark.value ? ThemeMode.dark : ThemeMode.light
    );
  }
}
