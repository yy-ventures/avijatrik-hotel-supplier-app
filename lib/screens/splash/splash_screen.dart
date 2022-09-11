import 'dart:async';

import 'package:avijatrik_hotel_supplier_app/screens/onboard/onboard_screen.dart';
import 'package:avijatrik_hotel_supplier_app/utils/index.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/custom/logo_with_title.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);

    Timer(Duration(seconds: 1), () {
      Navigator.popAndPushNamed(context, '/on-board');
    });
    return Scaffold(
      // extendBodyBehindAppBar: true,
      // appBar: const CustomAppBar(
      //   background: Colors.transparent,
      //   elevation: 0,
      // ),
      body: Container(
        color: brand,
        child: const Center(child: LogoWithTitle()),
      ),
    );
  }
}
