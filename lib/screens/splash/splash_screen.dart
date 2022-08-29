import 'package:avijatrik_hotel_supplier_app/widgets/appbar/appbar.dart';

import 'package:avijatrik_hotel_supplier_app/utils/index.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/custom/custom_text.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/custom/logo_with_title.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);

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
