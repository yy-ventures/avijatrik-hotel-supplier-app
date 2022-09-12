// Core
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// Third Party Packages
import 'package:country_code_picker/country_code_picker.dart';
// Widgets
import 'package:avijatrik_hotel_supplier_app/shared/widgets/custom/custom_text.dart';
// Utils
import 'package:avijatrik_hotel_supplier_app/shared/utils/index.dart';

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
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                  color: black50,
                  width: inputBorderWidth,
                )),
              ),
              child: Row(
                children: [
                  CustomText(
                    title: c!.dialCode!.toString(),
                    textColor: black50,
                  ),
                  const SizedBox(width: 8),
                  SvgPicture.asset(
                    'assets/icons/right_arrow_down.svg',
                    width: 6,
                    height: 6,
                    color: black50,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
