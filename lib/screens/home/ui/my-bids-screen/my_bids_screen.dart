import 'package:avijatrik_hotel_supplier_app/screens/home/ui/my-bids-screen/components/single_bid_component.dart';
import 'package:avijatrik_hotel_supplier_app/shared/utils/size_utils.dart';
import 'package:flutter/cupertino.dart';

class MyBidsScreen extends StatelessWidget {
  const MyBidsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    // final double bidScreenPadding = SizeUtils.screenWidth * 0.05;

    return Column(
      children: [
        const SizedBox(height: 20),
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
