import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_app/controller/bottom_bar_controller.dart';
import 'package:vpn_app/resources/app_colors.dart';
import 'package:vpn_app/resources/app_drawable.dart';
import 'package:vpn_app/view/screens/connection_page.dart';
import 'package:vpn_app/view/screens/home_page.dart';
import 'package:vpn_app/view/screens/setting_page.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/app_strings.dart';

class BottomBar extends StatelessWidget {
  final BottomBarController barController = Get.find<BottomBarController>();
  final List<Widget> pages = [HomePage(), ConnectionPage(), SettingPage()];

  BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: barController.currentIndex.value,
          children: pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppDrawable.svg.mapInactive,
                colorFilter: ColorFilter.mode(
                  AppColors.textLightGrey,
                  BlendMode.srcIn,
                ),
              ),
              label: AppStrings.countries,
              activeIcon: SvgPicture.asset(AppDrawable.svg.map),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppDrawable.svg.radar,
                colorFilter: ColorFilter.mode(
                  AppColors.textLightGrey,
                  BlendMode.srcIn,
                ),
              ),
              label: AppStrings.disconnect,
              activeIcon: SvgPicture.asset(AppDrawable.svg.radarActive),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppDrawable.svg.setting,
                colorFilter: ColorFilter.mode(
                  AppColors.textLightGrey,
                  BlendMode.srcIn,
                ),
              ),
              label: AppStrings.setting,
              activeIcon: SvgPicture.asset(AppDrawable.svg.settingActive),
            ),
          ],
          currentIndex: barController.currentIndex.value,
          onTap: barController.changeIndex,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          elevation: 10.0,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
