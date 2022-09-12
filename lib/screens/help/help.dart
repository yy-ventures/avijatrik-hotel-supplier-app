import 'package:avijatrik_hotel_supplier_app/shared/utils/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/widgets/custom/custom_text.dart';
import 'package:avijatrik_hotel_supplier_app/shared/widgets/image_with_shader/image_with_shader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);

    return Container(
      color: primaryWhite,
      child: Padding(
        padding: EdgeInsets.only(top: SizeUtils.screenHeight * 0.12),
        child: Stack(
          children: <Widget>[
            const ImageWithShader(
              imagePath: 'assets/images/help-bg.png',
              heightInPercentage: 60,
              gradient: helpScreenGradient,
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: SizeUtils.screenWidth * 0.5,
                    child: const CustomText(
                      title: 'For any information and queries, please contact',
                      textColor: primaryBlack,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 17.5,
                  ),
                  Container(
                    width: 134,
                    height: 5,
                    color: brand,
                  ),
                  const SizedBox(
                    height: 17.5,
                  ),
                  const CustomText(
                    title: '+880 1788 556 555',
                    textColor: primaryBlack,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  const CustomText(
                    title: 'Visit our website',
                    textColor: primaryBlack,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  const CustomText(
                    title: 'www.avijatrik.org',
                    textColor: brand,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
