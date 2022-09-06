import 'package:avijatrik_hotel_supplier_app/utils/color_utils.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/custom/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BidAlertComponent extends StatelessWidget {
  const BidAlertComponent({Key? key, this.underline = true}) : super(key: key);

  final bool underline;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const CustomText(
          title: 'Bid ID',
          textColor: black50,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(
          height: 10,
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
                  fontSize: 14,
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
            const CustomText(
              title: 'Bid details >',
              textColor: black50,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
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
