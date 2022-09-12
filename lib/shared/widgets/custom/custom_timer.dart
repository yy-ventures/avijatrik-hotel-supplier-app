import 'package:avijatrik_hotel_supplier_app/shared/helpers/converters.dart';
import 'package:avijatrik_hotel_supplier_app/shared/utils/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/widgets/custom/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';

class CustomTimer extends StatelessWidget {
  const CustomTimer({
    Key? key,
    required this.seconds,
    this.timeOnEnd,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w500,
    this.textColor = brand,
  }) : super(key: key);
  // Class props
  final int seconds;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;
  // Functions
  final void Function()? timeOnEnd;

  @override
  Widget build(BuildContext context) {
    // Get current localization of the app
    // Locale myLocale = Localizations.localeOf(context);
    // final locale = myLocale.toString();
    // print(locale);
    final startTime = DateTime.now();

    return CountdownTimer(
      endTime: startTime.add(Duration(seconds: seconds)).millisecondsSinceEpoch,
      onEnd: timeOnEnd,
      widgetBuilder: (_, CurrentRemainingTime? time) {
        return CustomText(
          title: time != null
              ? '${time.min != null ? time.min! < 10 ? Converters.getNumericValue('en', 0) : '' : ''}${Converters.getNumericValue('en', time.min ?? 00)}'
                  ':${time.sec != null ? time.sec! < 10 ? '${Converters.getNumericValue('en', 0)}'
                      '${Converters.getNumericValue('en', time.sec ?? 0)}' : '${Converters.getNumericValue('en', time.sec ?? 00)}' : '${Converters.getNumericValue('en', 00)}'}'
              : '${Converters.getNumericValue('en', 00)}:${Converters.getNumericValue('en', 00)}',
          fontSize: fontSize,
          fontWeight: fontWeight,
          textColor: textColor,
        );
      },
    );
  }
}
