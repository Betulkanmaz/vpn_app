import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_app/resources/app_strings.dart';
import '../../resources/app_colors.dart';

class DialogWidget extends StatelessWidget {
  final String content;
  final VoidCallback? onPressed;

  const DialogWidget({super.key, required this.content, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppStrings.connection),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: onPressed,
          child: Text(AppStrings.yes, style: TextStyle(color: AppColors.mainColor)),
        ),
        TextButton(
          onPressed: () => Get.back(),
          child: Text(AppStrings.no, style: TextStyle(color: AppColors.mainColor)),
        ),
      ],
    );
  }
}

SnackbarController snackBar(String title, String content, Widget icon) {
  return Get.snackbar(
    title,
    content,
    snackPosition: SnackPosition.TOP,
    duration: Duration(seconds: 3),
    icon: icon,
  );
}
