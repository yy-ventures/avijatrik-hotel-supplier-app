import 'package:avijatrik_hotel_supplier_app/utils/index.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/custom/custom_text.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class CountryCodeContainer extends StatelessWidget {
  const CountryCodeContainer({
    Key? key,
    this.onChange,
  }) : super(key: key);

  final Function(CountryCode)? onChange;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        height: 56,
        child: CountryCodePicker(
          // onChanged: (CountryCode country) async {
          //   print(country);
          // },
          onChanged: (CountryCode country) async => onChange!(country),
          padding: EdgeInsets.zero,
          initialSelection: '+880',
          showFlag: false,
          showFlagDialog: true,
          builder: (c) {
            return Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  inputBorderRadius,
                ),
                border: Border.all(
                  color: black20,
                  width: inputBorderWidth,
                ),
              ),
              child: Row(
                children: [
                  CustomText(
                    title: c!.dialCode!.toString(),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  // const CustomSvg(
                  //   svg: 'icons/keyboard_arrow_down.svg',
                  //   height: 10,
                  //   width: 10,
                  //   color: primaryBlack,
                  // ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
