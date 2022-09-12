import 'dart:async';

import 'package:avijatrik_hotel_supplier_app/shared/utils/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/widgets/custom/logo_with_title.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);

    Timer(const Duration(seconds: 1), () {
      Navigator.popAndPushNamed(context, '/on-board');
    });

    return Scaffold(
      body: Container(
        color: brand,
        child: const Center(child: LogoWithTitle()),
      ),
    );
  }
}
