import 'package:avijatrik_hotel_supplier_app/shared/utils/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/widgets/custom/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({
    Key? key,
    required this.text,
    this.showAsterisk = false,
    this.paddingTop = 8,
    this.showErrorIcon = false,
    this.centered = false,
  }) : super(key: key);

  final String text;
  final bool showAsterisk;
  final bool showErrorIcon;
  final double paddingTop;
  final bool centered;

  @override
  Widget build(BuildContext context) {
    return text.isNotEmpty
        ? Padding(
            padding: EdgeInsets.only(top: paddingTop),
            child: Row(
              mainAxisAlignment:
                  centered ? MainAxisAlignment.center : MainAxisAlignment.start,
              children: [
                if (showErrorIcon)
                  Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: SvgPicture.asset(
                      'assets/icons/error_icon.svg',
                    ),
                  )
                else
                  const SizedBox(),
                CustomText(
                  fontSize: 14,
                  textColor: primaryDanger,
                  title: !showAsterisk ? text : ('*') + text,
                ),
              ],
            ),
          )
        : const SizedBox();
  }
}
