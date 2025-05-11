import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_app/models/country.dart';

class SearchCountryController extends GetxController {
  final RxList<Country> countries =
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
        Country(
          name: 'France',
          flag: 'fr',
          city: 'Paris',
          locationCount: 8,
          strength: 80,
        ),
        Country(
          name: 'Spain',
          flag: 'es',
          city: 'Barcelona',
          locationCount: 6,
          strength: 75,
        ),
        Country(
          name: 'Sweden',
          flag: 'se',
          city: 'Stockholm',
          locationCount: 5,
          strength: 65,
        ),
        Country(
          name: 'United States',
          flag: 'us',
          city: 'New York',
          locationCount: 15,
          strength: 88,
        ),
        Country(
          name: 'United Kingdom',
          flag: 'gb',
          city: 'London',
          locationCount: 11,
          strength: 82,
        ),
        Country(
          name: 'Australia',
          flag: 'au',
          city: 'Sydney',
          locationCount: 7,
          strength: 76,
        ),
        Country(
          name: 'Brazil',
          flag: 'br',
          city: 'São Paulo',
          locationCount: 6,
          strength: 70,
        ),
        Country(
          name: 'India',
          flag: 'in',
          city: 'Mumbai',
          locationCount: 10,
          strength: 68,
        ),
        Country(
          name: 'South Korea',
          flag: 'kr',
          city: 'Seoul',
          locationCount: 12,
          strength: 92,
        ),
        Country(
          name: 'Switzerland',
          flag: 'ch',
          city: 'Zurich',
          locationCount: 4,
          strength: 83,
        ),
        Country(
          name: 'Singapore',
          flag: 'sg',
          city: 'Singapore',
          locationCount: 5,
          strength: 90,
        ),
        Country(
          name: 'Japan',
          flag: 'jp',
          city: 'Tokyo',
          locationCount: 14,
          strength: 95,
        ),
        Country(
          name: 'Canada',
          flag: 'ca',
          city: 'Toronto',
          locationCount: 9,
          strength: 78,
        ),
      ].obs;

  final RxList<Country> filteredCountries = <Country>[].obs;
  final RxString search = ''.obs;

  final FocusNode focusNode = FocusNode();

  @override
  void onInit() {
    filteredCountries.assignAll(countries);
    super.onInit();
  }

  void searchCountries(String text) {
    search.value = text;
    filterCountries();
  }

  void filterCountries() {
    if (search.value.isEmpty) {
      filteredCountries.assignAll(countries);
    } else {
      filteredCountries.assignAll(
        countries.where(
          (p0) => p0.name.toLowerCase().startsWith(search.value.toLowerCase()),
        ),
      );
    }
  }
}
