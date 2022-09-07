import 'package:avijatrik_hotel_supplier_app/utils/color_utils.dart';
import 'package:avijatrik_hotel_supplier_app/utils/index.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/button/footer_button.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/custom/custom_text.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/preference_tile/preference_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SingleBidComponent extends StatelessWidget {
  const SingleBidComponent({Key? key, this.expired = false}) : super(key: key);

  final bool expired;

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);

    return IntrinsicHeight(
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: white80,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 35, 25, 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const CustomText(
                    title: 'Bid No. 12',
                    textColor: black50,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(height: 6),
                  const CustomText(
                    title: 'Check-in date: 12 Sep, 2022',
                    textColor: black50,
                    fontSize: bidCardDetailsFontSize,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(height: 6),
                  const CustomText(
                    title: 'Check-out date: 14 Sep, 2022',
                    textColor: black50,
                    fontSize: bidCardDetailsFontSize,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(height: 6),
                  const CustomText(
                    title: 'Room category: Deluxe Couple',
                    textColor: black50,
                    fontSize: bidCardDetailsFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 6),
                  const CustomText(
                    title: 'Price range: 2000 - 500 BDT',
                    textColor: black50,
                    fontSize: bidCardDetailsFontSize,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: const [
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
                  const SizedBox(height: 17),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: const [
                      PreferenceTile(text: 'AC'),
                      PreferenceTile(text: 'Complimentary Breakfast'),
                      PreferenceTile(text: 'Bathtub'),
                      PreferenceTile(text: 'King-size Bed'),
                    ],
                  ),
                  const SizedBox(height: 17),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: <Widget>[
                          FooterButton(
                            text: 'Submit Bid',
                            fontSize: bidCardDetailsFontSize,
                            height: 32,
                            decreasePadding: 20,
                            onPressed: () {},
                          ),
                          const SizedBox(width: 7),
                          FooterButton(
                            color: redNotification,
                            fontSize: bidCardDetailsFontSize,
                            text: 'Cancel Bid',
                            height: 32,
                            decreasePadding: 20,
                            onPressed: () {},
                          ),
                        ],
                      ),
                      const CustomText(
                        title: 'Bid details >',
                        textColor: black50,
                        fontSize: bidCardDetailsFontSize,
                        fontWeight: FontWeight.w500,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          //* =====================Active/Expired Bid=======================
          Positioned(
            right: 0,
            child: Container(
              width: SizeUtils.screenWidth * 0.25,
              height: 40,
              decoration: BoxDecoration(
                color: expired ? black50 : brand,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: Center(
                child: CustomText(
                  title: expired ? 'Expired Bid' : 'Active Bid',
                  fontSize: bidCardDetailsFontSize + 2,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          //* ========================Timer=========================
          Positioned(
            right: SizeUtils.screenWidth * 0.1,
            top: 80,
            child: Container(
              decoration: BoxDecoration(
                color: primaryWhite,
                borderRadius: BorderRadius.circular(7),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: CustomText(
                  title: '14:23',
                  textColor: black50,
                  fontSize: bidCardTimerFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
