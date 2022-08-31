import 'package:avijatrik_hotel_supplier_app/widgets/appbar/appbar.dart';

import 'package:avijatrik_hotel_supplier_app/utils/index.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);

    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Hotel The Cox Today'),
    );
  }
}
