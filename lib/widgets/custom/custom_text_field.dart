import 'package:avijatrik_hotel_supplier_app/shared/constants/index.dart';
import 'package:avijatrik_hotel_supplier_app/utils/index.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/custom/label_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.labelText,
    required this.textController,
    this.isRequired = false,
    this.enable = true,
    this.onChange,
    this.textInputType = TextInputType.text,
    this.textCapitalization = TextCapitalization.words,
    this.inputFormatters,
  }) : super(key: key);

  final bool enable;
  final bool isRequired;
  final String labelText;
  final Function(String)? onChange;
  final TextEditingController textController;
  final TextInputType textInputType;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enable,
      controller: textController,
      onChanged: onChange,
      keyboardType: textInputType,
      textCapitalization: textCapitalization,
      cursorColor: primaryBlack,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: AppConstants.fontFamily,
      ),
      decoration: InputDecoration(
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: brand,
            width: inputBorderWidth,
          ),
        ),
        disabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: black70,
            width: inputBorderWidth,
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: black70,
            width: inputBorderWidth,
          ),
        ),
        label: LabelText(
          isRequired: isRequired,
          text: labelText,
          color: black70,
        ),
      ),
      inputFormatters: inputFormatters,
    );
  }
}
