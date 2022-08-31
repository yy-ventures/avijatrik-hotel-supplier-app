import 'package:avijatrik_hotel_supplier_app/shared/helpers/converters.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/custom/custom_text.dart';
import 'package:avijatrik_hotel_supplier_app/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';

class OtpTimer extends StatelessWidget {
  const OtpTimer({
    Key? key,
    required this.seconds,
    this.timeOnEnd,
  }) : super(key: key);
  final int seconds;
  final void Function()? timeOnEnd;

  @override
  Widget build(BuildContext context) {
    return CountdownTimer(
      endTime:
          DateTime.now().add(Duration(seconds: seconds)).millisecondsSinceEpoch,
      onEnd: timeOnEnd,
      widgetBuilder: (_, CurrentRemainingTime? time) {
        return CustomText(
          title: time != null
              ? '${Converters.getNumericValue('en', 0)}${Converters.getNumericValue('en', time.min ?? 00)}'
                  ':${time.sec != null ? time.sec! < 10 ? '${Converters.getNumericValue('en', 0)}'
                      '${Converters.getNumericValue('en', time.sec ?? 0)}' : '${Converters.getNumericValue('en', time.sec ?? 00)}' : '${Converters.getNumericValue('en', 00)}'}'
              : '${Converters.getNumericValue('en', 00)}:${Converters.getNumericValue('en', 00)}',
          fontSize: 14,
          textColor: brand,
          fontWeight: FontWeight.w500,
        );
      },
    );
  }
}
