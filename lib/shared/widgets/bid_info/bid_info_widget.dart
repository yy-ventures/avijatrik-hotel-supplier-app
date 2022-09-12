import 'package:avijatrik_hotel_supplier_app/shared/utils/color_utils.dart';
import 'package:avijatrik_hotel_supplier_app/shared/utils/style_utils.dart';
import 'package:avijatrik_hotel_supplier_app/shared/widgets/custom/custom_text.dart';
import 'package:flutter/cupertino.dart';

class BidInfoWidget extends StatelessWidget {
  const BidInfoWidget({
    Key? key,
    this.center = false,
    this.gap = 12,
  }) : super(key: key);

  final bool center;
  final double gap;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment:
          center ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: <Widget>[
        const CustomText(
          title: 'Bid No. 12',
          textColor: black50,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(height: gap),
        const CustomText(
          title: 'Check-in date: 12 Sep, 2022',
          textColor: black50,
          fontSize: bidCardDetailsFontSize,
          fontWeight: FontWeight.w500,
        ),
        const SizedBox(height: 8),
        const CustomText(
          title: 'Check-out date: 14 Sep, 2022',
          textColor: black50,
          fontSize: bidCardDetailsFontSize,
          fontWeight: FontWeight.w500,
        ),
        const SizedBox(height: 8),
        const CustomText(
          title: 'Room category: Deluxe Couple',
          textColor: black50,
          fontSize: bidCardDetailsFontSize,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: 8),
        const CustomText(
          title: 'Price range: 2000 - 500 BDT',
          textColor: black50,
          fontSize: bidCardDetailsFontSize,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(height: gap),
        Row(
          mainAxisAlignment:
              center ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: const <Widget>[
            CustomText(
              title: 'Room(s) needed: 01',
              textColor: black50,
              fontSize: bidCardDetailsFontSize,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(width: 36),
            CustomText(
              title: 'Pax: 02',
              textColor: black50,
              fontSize: bidCardDetailsFontSize,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ],
    );
  }
}
