import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:vpn_app/controller/search_country_controller.dart';
import 'package:vpn_app/models/country.dart';

void main(){
  late SearchCountryController controller;
  
  setUp(() {
    controller = SearchCountryController();
    Get.put(controller);

    controller.countries.assignAll([Country(
      name: 'Sweden',
      flag: 'se',
      city: 'Stockholm',
      locationCount: 5,
      strength: 65,
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
      ),]);
  },);
  
  tearDown(() {
    Get.delete<SearchCountryController>();
  },);
  
  test('filteredCountry if no filter',() {
    controller.search.value = '';
    controller.filterCountries();

    expect(controller.filteredCountries.length, 3);
    expect(controller.filteredCountries, controller.countries);
  },);

  test('if filtered', () {
    controller.search.value = 'ca';
    controller.filterCountries();

    expect(controller.filteredCountries.length, 1);
    expect(controller.filteredCountries.first.name, 'Canada');
  },);
}