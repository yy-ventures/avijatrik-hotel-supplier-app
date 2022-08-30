import 'package:avijatrik_hotel_supplier_app/shared/constants/index.dart';
import 'package:avijatrik_hotel_supplier_app/utils/index.dart';
import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  const LabelText({
    Key? key,
    required this.text,
    this.isRequired = false,
    this.fontSize = 16,
    this.color = primaryBlack,
    this.fontWeight = FontWeight.w400,
    this.textAlign = TextAlign.left,
  }) : super(key: key);

  final String text;
  final bool isRequired;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontFamily: AppConstants.fontFamily,
        ),
        children: <TextSpan>[
          TextSpan(
            text: isRequired ? ' *' : '',
            style: TextStyle(
              color: isRequired ? primaryDanger : color,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
