import 'package:flutter/material.dart';

import '../../resources/app_colors.dart';
import '../../resources/app_style.dart';

class AnimationCardWidget extends StatelessWidget {
  final Widget prefixWidget;
  final String mainText;
  final String subText;
  final Color boxColor;

  const AnimationCardWidget({
    super.key,
    required this.prefixWidget,
    required this.mainText,
    required this.subText,
    required this.boxColor,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      elevation: 2,
      color: AppColors.bgWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: size.height * 0.04,
                  width: size.width * 0.09,
                  padding: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    color: boxColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: prefixWidget,
                ),
                SizedBox(width: 4.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(mainText, style: AppStyle.subText),
                    Text(subText, style: AppStyle.h2),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget cardWidget(
  Widget prefixWidget,
  String mainText,
  String subText,
  TextStyle? style,
  TextStyle? subStyle, {
  Widget? suffixWidget,
}) {
  return Card(
    elevation: 2,
    color: AppColors.bgWhite,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: Padding(
      padding: EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              prefixWidget,
              SizedBox(width: 4.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(mainText, style: style),
                  Text(subText, style: subStyle),
                ],
              ),
            ],
          ),
          if (suffixWidget != null) suffixWidget,
        ],
      ),
    ),
  );
}
