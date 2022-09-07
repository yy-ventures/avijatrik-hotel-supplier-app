import 'package:avijatrik_hotel_supplier_app/screens/my-bids-screen/components/single_bid_component.dart';
import 'package:avijatrik_hotel_supplier_app/utils/index.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/custom/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyBidsScreen extends StatelessWidget {
  const MyBidsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    // final double bidScreenPadding = SizeUtils.screenWidth * 0.05;

    return Column(
      children: [
        SizedBox(height: 20),
        Expanded(
          child: SingleChildScrollView(
            child: Wrap(
              runSpacing: 20,
              children: const <Widget>[
                SingleBidComponent(),
                SingleBidComponent(
                  expired: true,
                ),
                SingleBidComponent(),
                SingleBidComponent(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
