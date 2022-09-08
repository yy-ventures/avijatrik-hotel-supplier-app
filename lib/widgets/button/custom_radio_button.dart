import 'package:avijatrik_hotel_supplier_app/utils/color_utils.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/custom/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomRadioButton extends StatefulWidget {
  const CustomRadioButton({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  bool _selected = false;

  get text => widget.text;

  @override
  Widget build(BuildContext context) {
    const double checkBoxWidth = 24;

    return GestureDetector(
      onTap: (() {
        setState(() {
          _selected = !_selected;
        });
      }),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 11.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(width: 1, color: brand),
                borderRadius: BorderRadius.circular(checkBoxWidth / 2),
              ),
              width: checkBoxWidth,
              height: checkBoxWidth,
              child: Align(
                alignment: Alignment.center,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  decoration: BoxDecoration(
                    color: _selected ? brand : Colors.transparent,
                    borderRadius: BorderRadius.circular(checkBoxWidth / 2),
                  ),
                  width: checkBoxWidth / 1.5,
                  height: checkBoxWidth / 1.5,
                ),
              ),
            ),
            const SizedBox(width: 10),
            CustomText(
              title: text,
              textColor: black50,
              fontWeight: FontWeight.bold,
            )
          ],
        ),
      ),
    );
  }
}
