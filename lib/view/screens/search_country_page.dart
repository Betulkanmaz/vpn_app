import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vpn_app/controller/search_country_controller.dart';
import 'package:vpn_app/helper/flag_helper.dart';
import 'package:vpn_app/resources/app_drawable.dart';
import 'package:vpn_app/resources/app_strings.dart';

import '../../resources/app_colors.dart';
import '../../resources/app_style.dart';

class SearchCountryPage extends StatelessWidget {
  final SearchCountryController searchCountryController = Get.put(
    SearchCountryController(),
  );

  SearchCountryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppDrawable.bg),
                fit: BoxFit.fill,
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
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.boxColor,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        padding: EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            searchCountryController.onClose();
                            Get.back();
                          },
                          child: Icon(
                            Icons.keyboard_backspace,
                            color: AppColors.bgWhite,
                          ),
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Text(AppStrings.countries, style: AppStyle.h1),
                    ],
                  ),
                  SizedBox(height: 24),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.bgWhite,
                    ),
                    child: TextField(
                      autofocus: true,
                      focusNode: searchCountryController.focusNode,
                      onChanged:
                          (value) =>
                              searchCountryController.searchCountries(value),
                      decoration: InputDecoration(
                        hintText: AppStrings.searchBar,
                        hintStyle: AppStyle.search,
                        suffixIcon: SvgPicture.asset(AppDrawable.svg.search),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        suffixIconConstraints: BoxConstraints.loose(
                          Size.fromHeight(24),
                        ),
                      ),
                      cursorColor: AppColors.mainColor,
                      style: TextStyle(color: AppColors.textBlack),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 16),
                itemCount: searchCountryController.filteredCountries.length,
                itemBuilder: (context, index) {
                  final country =
                      searchCountryController.filteredCountries[index];
                  return ListTile(
                    title: Row(
                      children: [
                        Text(toFlag(country.flag), style: AppStyle.flagSearch),
                        SizedBox(width: 4),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(country.name, style: AppStyle.b1),
                            Text(
                              '${country.locationCount} ${AppStrings.location}',
                              style: AppStyle.b2,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
