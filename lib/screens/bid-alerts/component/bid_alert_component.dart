import 'package:avijatrik_hotel_supplier_app/utils/color_utils.dart';
import 'package:avijatrik_hotel_supplier_app/utils/index.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/custom/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BidAlertComponent extends StatelessWidget {
  const BidAlertComponent({Key? key, this.underline = true}) : super(key: key);

  final bool underline;

  @override
  Widget build(BuildContext context) {
    // Styles for a transparent button
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      primary: Colors.transparent,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const CustomText(
          title: 'Bid ID',
          textColor: black50,
          fontWeight: FontWeight.bold,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const CustomText(
                  title: 'Time remaining',
                  textColor: black50,
                  fontSize: bidCardDetailsFontSize + 2,
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  color: lightGrey,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: CustomText(
                      title: '14:23',
                      textColor: black50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            ElevatedButton(
              style: buttonStyle,
              onPressed: () {
                Navigator.pushNamed(context, '/bid-details');
              },
              child: const CustomText(
                title: 'Bid details >',
                textColor: black50,
                fontSize: bidCardDetailsFontSize + 2,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        underline
            ? Container(
                height: 1,
                color: brand,
              )
            : const SizedBox(),
      ],
    );
  }
}
