import 'package:avijatrik_hotel_supplier_app/shared/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:avijatrik_hotel_supplier_app/utils/index.dart';

class AnimatedCustomText extends StatelessWidget {
  const AnimatedCustomText(
      {Key? key,
      required this.duration,
      required this.title,
      this.curve = Curves.easeInOut,
      this.fontSize = 16,
      this.textColor = primaryWhite,
      this.fontWeight = FontWeight.w400})
      : super(key: key);

  final Duration duration;
  final Curve curve;
  final String title;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultTextStyle(
      curve: curve,
      duration: duration,
      style: TextStyle(
        fontFamily: AppConstants.fontFamily,
        color: textColor,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
      ),
    );
  }
}
