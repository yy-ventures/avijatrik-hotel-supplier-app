import 'package:avijatrik_hotel_supplier_app/utils/index.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/appbar/appbar.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/custom/custom_text.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/image_with_shader/image_with_shader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Setting System UI Styles
    SystemChrome.setSystemUIOverlayStyle(transparentNavigation());
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge,
        overlays: [SystemUiOverlay.top]);

    // UI
    return Scaffold(
      backgroundColor: primaryWhite,
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(
        elevation: 0,
        statusbarTransparent: true,
      ),
      body: Stack(alignment: Alignment.center, children: <Widget>[
        const Positioned(
          top: 0,
          left: 0,
          child: ImageWithShader(
            imagePath: 'assets/images/bg-img.png',
            heightInPercentage: 65,
            symmetricShader: true,
          ),
        ),
        Positioned(
          top: SizeUtils.screenHeight * 0.6,
          child: Column(
            children: const [
              CustomText(
                title: 'Sign In',
                textColor: brand,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 33),
              CustomText(
                title: 'Enter your phone number',
                textColor: black70,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 4),
              CustomText(
                title: 'We will send you a code on this number',
                textColor: black70,
                fontSize: 14,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
