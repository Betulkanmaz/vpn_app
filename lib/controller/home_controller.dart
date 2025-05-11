import 'dart:async';
import 'dart:math';

import 'package:get/get.dart';
import 'package:vpn_app/models/connection_stats.dart';
import 'package:vpn_app/models/country.dart';
import 'package:vpn_app/resources/app_colors.dart';

class HomeController extends GetxController {
  final RxList<Country> freeCountries =
      [
        Country(
          name: 'Italy',
          flag: 'it',
          city: '',
          locationCount: 4,
          strength: 70,
        ),
        Country(
          name: 'Netherlands',
          flag: 'nl',
          city: 'Amsterdam',
          locationCount: 12,
          strength: 85,
        ),
        Country(
          name: 'Germany',
          flag: 'de',
          city: '',
          locationCount: 10,
          strength: 90,
        ),
      ].obs;

  final Rx<ConnectionStats> mockConnectionState =
      ConnectionStats(
        downloadSpeed: 0,
        uploadSpeed: 0,
        connectedTime: Duration.zero,
        connectedCountry: null,
      ).obs;

  RxString hoursString = '00'.obs;
  RxString minuteString = '00'.obs;
  RxString secondString = '00'.obs;

  RxInt hours = 0.obs;
  RxInt minutes = 0.obs;
  RxInt seconds = 0.obs;

  RxBool isTimerRunning = false.obs;
  RxBool hasActiveConnection = false.obs;
  RxBool isLoading = false.obs;

  var isDark = false.obs;
  Timer? _timer;
  late DateTime _startTime;

  @override
  void onInit() {
    final connectedTime = mockConnectionState.value.connectedTime;
    setConnectedTime(connectedTime);
    if (mockConnectionState.value.connectedCountry != null) {
      startTimer(connectedTime);
    }
    super.onInit();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  Future<void> loadingProcess() async {
    isLoading.value = true;

    await Future.delayed(Duration(seconds: 1));

    isLoading.value = false;
  }

  void setConnectedTime(Duration connectedTime) {
    hours.value = connectedTime.inHours;
    minutes.value = connectedTime.inMinutes.remainder(60);
    seconds.value = connectedTime.inSeconds.remainder(60);

    hoursString.value = hours.value.toString().padLeft(2, '0');
    minuteString.value = minutes.value.toString().padLeft(2, '0');
    secondString.value = seconds.value.toString().padLeft(2, '0');
  }

  void startTimer(Duration firstTime) {
    _startTime = DateTime.now().subtract(firstTime);
    isTimerRunning.value = true;

    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      final differenceTime = DateTime.now().difference(_startTime);

      hours.value = differenceTime.inHours;
      minutes.value = differenceTime.inMinutes.remainder(60);
      seconds.value = differenceTime.inSeconds.remainder(60);

      hoursString.value = hours.value.toString().padLeft(2, '0');
      minuteString.value = minutes.value.toString().padLeft(2, '0');
      secondString.value = seconds.value.toString().padLeft(2, '0');

      mockConnectionState.value = mockConnectionState.value.copyWith(
        downloadSpeed: (520 + (Random()).nextInt(550 - 520)).toInt(),
        uploadSpeed: (42 + (Random()).nextInt(50 - 42)).toInt(),
        connectedTime: differenceTime,
      );
    });
  }

  void pauseTimer() {
    _timer?.cancel();
    isTimerRunning.value = false;
  }

  void resetTimer() {
    _timer?.cancel();
    seconds.value = 0;
    minutes.value = 0;
    hours.value = 0;
    secondString.value = '00';
    minuteString.value = '00';
    hoursString.value = '00';
  }

  void disconnect() {
    for (int i = 0; i < freeCountries.length; i++) {
      if (freeCountries[i].isConnected) {
        freeCountries[i] = freeCountries[i].copyWith(isConnected: false);
      }
    }

    pauseTimer();
    resetTimer();

    mockConnectionState.value = mockConnectionState.value.copyWith(
      connectedCountry: null,
      connectedTime: Duration.zero,
    );
    hasActiveConnection.value = false;
  }

  void checkConnection(int index) {
    final selectedCountry = freeCountries[index];

    if (selectedCountry.isConnected) {
      disconnect();
      return;
    }

    for (int i = 0; i < freeCountries.length; i++) {
      freeCountries[i] = freeCountries[i].copyWith(isConnected: false);
    }

    freeCountries[index] = selectedCountry.copyWith(isConnected: true);
    mockConnectionState.value = mockConnectionState.value.copyWith(
      connectedCountry: selectedCountry,
      connectedTime: Duration.zero,
    );

    hasActiveConnection.value = true;

    resetTimer();
    startTimer(Duration.zero);
  }

  void changeTheme(){
    isDark.value = !isDark.value;
    Get.changeTheme(isDark.value ? AppTheme.dark: AppTheme.light);
  }

  void closeDialogCustom(){
    if (Get.isDialogOpen ?? false) {
      Get.until((route) => !Get.isDialogOpen!);
    }
  }

}
