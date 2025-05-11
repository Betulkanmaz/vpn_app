import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:vpn_app/controller/home_controller.dart';

void main() {
  late HomeController controller;

  setUp(() {
    controller = HomeController();
    Get.put(controller);
  });

  tearDown(() {
    Get.delete<HomeController>();
  });

  test('setConnectedTime should correctly update time values', () {
    controller.setConnectedTime(Duration(hours: 1, minutes: 30, seconds: 45));

    expect(controller.hours.value, 1);
    expect(controller.minutes.value, 30);
    expect(controller.seconds.value, 45);
    expect(controller.hoursString.value, '01');
    expect(controller.minuteString.value, '30');
    expect(controller.secondString.value, '45');
  });

  test('checkConnection', () {
    controller.checkConnection(1);
    final connectedCountry =
        controller.freeCountries.where((p0) => p0.isConnected).toList();
    expect(connectedCountry.length, 1);
    expect(connectedCountry.first.name, 'Netherlands');
  });
}
