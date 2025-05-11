import 'package:flutter/material.dart';

import '../../resources/app_colors.dart';

class ButtonWidget extends StatelessWidget {
  final bool active;
  final IconData icon;
  final VoidCallback? func;

  const ButtonWidget({
    super.key,
    this.active = false,
    required this.icon,
    this.func,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: func,
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: active ? AppColors.mainColor : AppColors.bgLight,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          color: active ? AppColors.bgWhite : AppColors.textBlack,
        ),
      ),
    );
  }
}
