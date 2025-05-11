import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_app/controller/home_controller.dart';
import '../widgets/home_widgets.dart';

class HomePage extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: [
              headerCountriesSearch(homeController),
              SizedBox(height: 16),
              Column(
                children: [
                  connectionTimer(homeController),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 23.0),
                          child: Obx(() {
                            var connectionStats =
                                homeController.mockConnectionState.value;
                            if (!homeController.hasActiveConnection.value) {
                              return SizedBox.shrink();
                            }
                            var country = connectionStats.connectedCountry!;

                            return connectedCountry(
                              country.name,
                              country.flag,
                              country.city,
                              country.strength,
                              connectionStats.downloadSpeed,
                              connectionStats.uploadSpeed,
                              homeController,
                            );
                          }),
                        ),
                        SizedBox(height: 24),
                        freeLocationsList(homeController),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
