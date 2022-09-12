import 'package:avijatrik_hotel_supplier_app/shared/utils/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/widgets/custom/custom_text.dart';
import 'package:flutter/material.dart';

class FooterButton extends StatelessWidget {
  const FooterButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.fontSize = 18,
    this.height = 52,
    this.decreasePadding = 0,
    this.color = brand,
    this.textColor = primaryWhite,
    this.iconColor = primaryWhite,
    this.icon = '',
    this.isLoading = false,
  }) : super(key: key);

  final double height;
  final double decreasePadding;
  final double fontSize;
  final String text;
  final Color color;
  final Color textColor;
  final String? icon;
  final Color iconColor;
  final bool isLoading;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: color,
      disabledColor: disableColor,
      elevation: 0,
      height: height,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      padding: EdgeInsets.only(
          left: height - decreasePadding, right: height - decreasePadding),
      child: isLoading
          ? SizedBox(
              height: height / 2,
              width: height / 2,
              child: const CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(primaryWhite),
              ),
            )
          : CustomText(
              title: text,
              textColor: onPressed == null ? disableTextColor : textColor,
              fontWeight: FontWeight.w700,
              fontSize: fontSize,
            ),
    );
  }
}
