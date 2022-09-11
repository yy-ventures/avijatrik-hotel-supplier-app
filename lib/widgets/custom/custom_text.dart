import 'package:flutter/material.dart';
import 'package:avijatrik_hotel_supplier_app/utils/index.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.title,
    this.fontSize = 16,
    this.textColor = primaryWhite,
    this.fontWeight = FontWeight.w400,
    this.align = TextAlign.center,
  }) : super(key: key);

  final String title;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;
  final TextAlign align;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: align,
      style: TextStyle(
        color: textColor,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    );
  }
}
