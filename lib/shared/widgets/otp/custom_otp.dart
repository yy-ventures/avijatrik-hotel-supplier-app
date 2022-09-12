import 'package:avijatrik_hotel_supplier_app/shared/constants/app_constants.dart';
import 'package:avijatrik_hotel_supplier_app/shared/utils/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/utils/style_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpField extends StatelessWidget {
  const OtpField({
    Key? key,
    required this.controller,
    required this.onChanged,
    this.onCompleted,
    this.hasError = false,
  }) : super(key: key);

  final TextEditingController controller;
  final bool hasError;
  final Function(String) onChanged;
  final ValueChanged<String>? onCompleted;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      textStyle: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20,
        fontFamily: AppConstants.fontFamily,
      ),
      cursorHeight: 18,
      appContext: context,
      length: 6,
      enableActiveFill: true,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        borderWidth: borderWidth,
        selectedColor: brand,
        selectedFillColor: primaryWhite,
        activeFillColor: blackOpacity,
        activeColor: hasError ? primaryDanger : inputBorderColor,
        inactiveColor: inputBorderColor,
        inactiveFillColor: blackOpacity,
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(borderRadius),
        fieldHeight: SizeUtils.screenWidth * .125,
        fieldWidth: SizeUtils.screenWidth * .125,
        errorBorderColor: primaryDanger,
      ),
      cursorColor: brand,
      animationDuration: const Duration(milliseconds: 300),
      keyboardType: TextInputType.number,
      controller: controller,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
      ],
      onCompleted: onCompleted,
      onChanged: onChanged,
    );
  }
}
