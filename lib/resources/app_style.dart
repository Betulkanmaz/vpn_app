import 'package:flutter/material.dart';
import 'package:vpn_app/resources/app_colors.dart';

class AppStyle {
  static var flag = TextStyle(fontSize: 24);
  static var flagSearch = TextStyle(fontSize: 30);
  static var h1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textWhite,
  );
  static var h2 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textBlack,
  );
  static var b1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static var b2 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textMediumGrey,
  );
  static var subText = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: AppColors.textMediumGrey,
  );
  static var text = TextStyle(fontSize: 12, fontWeight: FontWeight.normal);
  static var textDark = TextStyle(fontSize: 12);
  static var timeText = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static var search = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textMediumGrey,
  );
}
