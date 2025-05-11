import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:vpn_app/resources/app_strings.dart';
import 'package:vpn_app/resources/app_style.dart';
import 'package:vpn_app/view/screens/search_country_page.dart';
import 'package:vpn_app/view/widgets/button_widget.dart';
import 'package:vpn_app/view/widgets/dialog_widget.dart';

import '../../controller/home_controller.dart';
import '../../helper/flag_helper.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_drawable.dart';
import 'card_widgets.dart';

Widget freeLocationsList(HomeController controller) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${AppStrings.freeLocations} (${controller.freeCountries.length})',
            style: AppStyle.text,
          ),
          Icon(Icons.info, color: AppColors.textMediumGrey, size: 16),
        ],
      ),
      Obx(
        () => ListView.builder(
          itemBuilder: (context, index) {
            var country = controller.freeCountries[index];

            return Column(
              children: [
                cardWidget(
                  Text(toFlag(country.flag), style: TextStyle(fontSize: 24)),
                  country.name,
                  '${country.locationCount.toString()} ${AppStrings.location}',
                  AppStyle.h2,
                  AppStyle.subText,
                  suffixWidget: Row(
                    children: [
                      ButtonWidget(
                        icon: Icons.power_settings_new,
                        active: country.isConnected,
                        func: () {
                          if (country.isConnected) {
                            Get.dialog(
                              DialogWidget(
                                content: AppStrings.disconnectContent,
                                onPressed: () {
                                  controller.onClose();
                                  controller.checkConnection(index);
                                  if (Get.isDialogOpen ?? false) {
                                    Get.until((route) => !Get.isDialogOpen!);
                                  }
                                  snackBar(
                                    AppStrings.disconnected,
                                    AppStrings.disconnectApprove,
                                    Icon(
                                      Icons.vpn_key_off,
                                      color: Colors.white,
                                    ),
                                  );
                                },
                              ),
                            );
                          } else {
                            Get.dialog(
                              DialogWidget(
                                content: AppStrings.connectContent,
                                onPressed: () async {
                                  controller.closeDialogCustom();
                                  Get.dialog(
                                    Dialog(
                                      backgroundColor: Colors.transparent,
                                      elevation: 0,
                                      child: Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    ),
                                    barrierDismissible: false,
                                  );

                                  await controller.loadingProcess();
                                  controller.closeDialogCustom();
                                  snackBar(
                                    AppStrings.connect,
                                    AppStrings.connectApprove,
                                    Icon(Icons.vpn_key, color: Colors.white),
                                  );
                                  controller.startTimer(Duration.zero);
                                  controller.checkConnection(index);
                                },
                              ),
                            );
                          }
                        },
                      ),
                      SizedBox(width: 6.0),
                      ButtonWidget(icon: Icons.chevron_right),
                    ],
                  ),
                ),
                SizedBox(height: 8.0),
              ],
            );
          },
          itemCount: controller.freeCountries.length,
          shrinkWrap: true,
          padding: EdgeInsets.only(top: 6.0),
        ),
      ),
    ],
  );
}

Widget headerCountriesSearch(HomeController controller) {
  return Stack(
    children: [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppDrawable.bg),
            fit: BoxFit.fitWidth,
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(36.0),
            bottomRight: Radius.circular(36.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.boxColor,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    padding: EdgeInsets.all(8.0),
                    child: SvgPicture.asset(AppDrawable.svg.category),
                  ),
                  Text(AppStrings.countries, style: AppStyle.h1),
                  Obx(
                    () => InkWell(
                      onTap: () => controller.changeTheme(),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.boxColor,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          controller.isDark.value
                              ? Icons.light_mode
                              : Icons.dark_mode,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.bgWhite,
                ),
                child: TextField(
                  onTap: () => Get.to(SearchCountryPage()),
                  showCursor: false,
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: AppStrings.searchBar,
                    hintStyle: AppStyle.search,
                    suffixIcon: SvgPicture.asset(AppDrawable.svg.search),
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                    suffixIconConstraints: BoxConstraints.loose(
                      Size.fromHeight(24),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget connectionTimer(HomeController controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.0),
    child: Obx(
      () => Column(
        children: [
          Text(AppStrings.connectingTime),
          Text(
            '${controller.hoursString} : ${controller.minuteString} : ${controller.secondString}',
            style: AppStyle.timeText,
          ),
        ],
      ),
    ),
  );
}

Widget connectedCountry(
  String name,
  String flag,
  String? city,
  int strength,
  int downloadSpeed,
  int uploadSpeed,
  HomeController controller,
) {
  return Column(
    children: [
      cardWidget(
        Text(toFlag(flag), style: AppStyle.flag),
        name,
        city ?? '',
        AppStyle.h2,
        AppStyle.subText,
        suffixWidget: Column(
          children: [
            Text(AppStrings.strength, style: AppStyle.subText),
            Text('$strength %', style: AppStyle.textDark),
          ],
        ),
      ),

      SizedBox(height: 8.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: AnimationCardWidget(
              prefixWidget: Lottie.asset(
                'assets/animations/download.json',
                fit: BoxFit.fill,
                repeat: true,
              ),
              mainText: AppStrings.download,
              subText: '$downloadSpeed ${AppStrings.mb}',
              boxColor: AppColors.download,
            ),
          ),

          SizedBox(width: 8.0),
          Expanded(
            child: AnimationCardWidget(
              prefixWidget: Lottie.asset(
                'assets/animations/upload.json',
                repeat: true,
              ),
              mainText: AppStrings.upload,
              subText: '$uploadSpeed ${AppStrings.mb}',
              boxColor: AppColors.upload,
            ),
          ),
        ],
      ),
    ],
  );
}
