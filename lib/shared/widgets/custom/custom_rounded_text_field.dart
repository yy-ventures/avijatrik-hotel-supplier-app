import 'package:avijatrik_hotel_supplier_app/shared/utils/color_utils.dart';
import 'package:avijatrik_hotel_supplier_app/shared/widgets/custom/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomRoundedTextField extends StatelessWidget {
  const CustomRoundedTextField({
    Key? key,
    required this.labelText,
    required this.textController,
    this.enabled = true,
    this.isRequired = false,
    this.error = false,
    this.onChange,
    this.textInputType = TextInputType.text,
    this.textCapitalization = TextCapitalization.words,
    this.inputFormatters,
  }) : super(key: key);

  final String labelText;
  final TextEditingController textController;
  final bool enabled;
  final bool isRequired;
  final bool error;
  final Function(String)? onChange;
  final TextInputType textInputType;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: enabled,
      controller: textController,
      keyboardType: TextInputType.number,
      onChanged: onChange,
      cursorColor: error ? primaryDanger : blue80,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 25),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: error ? primaryDanger : blue80,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: brand,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: black40,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        label: CustomText(
          title: labelText,
          textColor: error ? primaryDanger : black50,
        ),
        floatingLabelAlignment: FloatingLabelAlignment.center,
      ),
      textAlign: TextAlign.center,
      inputFormatters: inputFormatters,
      style: const TextStyle(color: black50),
    );
  }
}
