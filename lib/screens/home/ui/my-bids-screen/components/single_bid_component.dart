import 'package:avijatrik_hotel_supplier_app/shared/utils/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/utils/size_utils.dart';
import 'package:avijatrik_hotel_supplier_app/shared/widgets/bid_info/bid_info_widget.dart';
import 'package:avijatrik_hotel_supplier_app/shared/widgets/button/footer_button.dart';
import 'package:avijatrik_hotel_supplier_app/shared/widgets/custom/custom_text.dart';
import 'package:avijatrik_hotel_supplier_app/shared/widgets/custom/custom_timer.dart';
import 'package:avijatrik_hotel_supplier_app/shared/widgets/preference_tile/preference_tile.dart';
import 'package:flutter/material.dart';

class SingleBidComponent extends StatelessWidget {
  const SingleBidComponent({Key? key, this.expired = false}) : super(key: key);

  final bool expired;

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    // Styles for a transparent button
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      primary: Colors.transparent,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
    );

    return IntrinsicHeight(
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: white80,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 35, 5, 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const BidInfoWidget(),
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
                      ElevatedButton(
                        style: buttonStyle,
                        onPressed: () {
                          Navigator.pushNamed(context, '/bid-details');
                        },
                        child: const CustomText(
                          title: 'Bid details >',
                          textColor: black50,
                          fontSize: bidCardDetailsFontSize,
                          fontWeight: FontWeight.w500,
                        ),
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
                child: CustomTimer(
                  seconds: 900,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  textColor: black50,
                ),
                // child: CustomText(
                //   title: '14:23',
                //   textColor: black50,
                //   fontSize: bidCardTimerFontSize,
                //   fontWeight: FontWeight.bold,
                // ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
