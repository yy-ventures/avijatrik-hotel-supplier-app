import 'package:avijatrik_hotel_supplier_app/utils/index.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/custom/custom_text.dart';
import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({
    Key? key,
    required this.text,
    this.showAsterisk = false,
    this.paddingTop = 8,
    this.showErrorIcon = false,
  }) : super(key: key);

  final String text;
  final bool showAsterisk;
  final bool showErrorIcon;
  final double paddingTop;

  @override
  Widget build(BuildContext context) {
    return text.isNotEmpty
        ? Padding(
            padding: EdgeInsets.only(top: paddingTop),
            child: Row(
              children: [
                if (showErrorIcon)
                  const Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Icon(Icons.abc),
                  )
                else
                  const SizedBox(),
                Expanded(
                  child: CustomText(
                    fontSize: 14,
                    textColor: primaryDanger,
                    title: !showAsterisk ? text : ('*') + text,
                  ),
                ),
              ],
            ),
          )
        : const SizedBox();
  }
}
