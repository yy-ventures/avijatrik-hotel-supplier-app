import 'package:avijatrik_hotel_supplier_app/constants/app_constants.dart';
import 'package:avijatrik_hotel_supplier_app/infrastructure/route.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: AppConstants.fontFamily),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoute.onGenerateRoute,
      initialRoute: '/sign-in',
    );
  }
}
