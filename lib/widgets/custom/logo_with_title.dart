import 'package:avijatrik_hotel_supplier_app/widgets/custom/custom_text.dart';
import 'package:flutter/material.dart';

class LogoWithTitle extends StatelessWidget {
  const LogoWithTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/logo.png',
        ),
        const SizedBox(height: 25),
        const CustomText(
          title: 'Hotel Supplier App',
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: 8),
        const CustomText(
          title: 'www.avijatrik.org',
          fontSize: 16,
          fontWeight: FontWeight.w500,
        )
      ],
    );
  }
}
