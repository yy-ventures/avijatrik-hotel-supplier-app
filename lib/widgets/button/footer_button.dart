import 'package:avijatrik_hotel_supplier_app/utils/index.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/custom/custom_text.dart';
import 'package:flutter/material.dart';

class FooterButton extends StatelessWidget {
  const FooterButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color = brand,
    this.textColor = primaryWhite,
    this.iconColor = primaryWhite,
    this.icon = '',
    this.isLoading = false,
  }) : super(key: key);

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
      height: 52,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      padding: const EdgeInsets.only(left: 50, right: 50),
      child: isLoading
          ? const SizedBox(
              height: 25,
              width: 25,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(primaryWhite),
              ),
            )
          : CustomText(
              title: text,
              textColor: onPressed == null ? disableTextColor : textColor,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
    );
  }
}
