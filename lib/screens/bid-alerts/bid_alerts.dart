import 'package:avijatrik_hotel_supplier_app/blocs/otp/blocs/timer_bloc.dart';
import 'package:avijatrik_hotel_supplier_app/screens/bid-alerts/component/bid_alert_component.dart';
import 'package:avijatrik_hotel_supplier_app/shared/utils/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/utils/size_utils.dart';
import 'package:avijatrik_hotel_supplier_app/shared/widgets/custom/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BidAlertScreen extends StatelessWidget {
  const BidAlertScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Media Query Class Initialized
    SizeUtils().init(context);

    // Number of items in the list (static | must delete later when api is integrated)
    const int itemCount = 10;

    return BlocProvider(
      create: (context) => TimerBloc(),
      child: Expanded(
        child: SingleChildScrollView(
          child: Container(
              color: primaryWhite,
              child: Column(
                children: [
                  ClipPath(
                    clipper: CustomClipPath(),
                    child: Container(
                      alignment: Alignment.topCenter,
                      height: SizeUtils.screenHeight * 0.25,
                      color: brand,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: (SizeUtils.screenHeight * 0.31) / 5),
                        child: SvgPicture.asset(
                          'assets/icons/alert_icon.svg',
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ),
                  const CustomText(
                    title: 'This Week',
                    textColor: black50,
                    fontWeight: FontWeight.w500,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 40),
                    child: Column(
                      children: [
                        for (var i = 0; i < itemCount; i++)
                          Column(
                            children: <Widget>[
                              BidAlertComponent(),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          )
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();
    path.lineTo(0, h / 1.25);
    path.quadraticBezierTo(w * 0.5, h + 5, w, h / 1.25);
    path.lineTo(w, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
