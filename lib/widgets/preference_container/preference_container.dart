import 'package:avijatrik_hotel_supplier_app/utils/color_utils.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/button/custom_radio_button.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/custom/custom_text.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/preference_tile/preference_tile.dart';
import 'package:flutter/cupertino.dart';

class PreferenceContainer extends StatelessWidget {
  const PreferenceContainer({
    Key? key,
    required this.heading,
    required this.preferences,
    required this.hotelServices,
  }) : super(key: key);

  final String heading;
  final List<String> preferences;
  final List<String> hotelServices;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomText(
          title: 'Primary Preference',
          textColor: brand,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: 25),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: <Widget>[
            for (var preference in preferences) PreferenceTile(text: preference)
          ],
        ),
        const SizedBox(height: 28),
        const CustomText(
          title: 'Match with your Hotel',
          textColor: black50,
          fontWeight: FontWeight.w500,
        ),
        const SizedBox(height: 23),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                for (var service
                    in hotelServices.sublist(0, hotelServices.length ~/ 2))
                  CustomRadioButton(text: service)
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                for (var service in hotelServices.sublist(
                    hotelServices.length ~/ 2, hotelServices.length))
                  CustomRadioButton(text: service)
              ],
            ),
          ],
        ),
      ],
    );
  }
}
