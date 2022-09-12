import 'package:avijatrik_hotel_supplier_app/shared/utils/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/widgets/custom/custom_text.dart';
import 'package:flutter/cupertino.dart';

class PreferenceTile extends StatelessWidget {
  const PreferenceTile({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: lightGrey,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: CustomText(
          title: text,
          textColor: black50,
          fontSize: bidCardDetailsFontSize,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
