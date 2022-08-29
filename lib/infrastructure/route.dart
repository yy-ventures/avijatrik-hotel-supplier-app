import 'package:avijatrik_hotel_supplier_app/screens/home/home_screen.dart';
import 'package:avijatrik_hotel_supplier_app/screens/onboard/onboard_screen.dart';
import 'package:avijatrik_hotel_supplier_app/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class AppRoute {
  // ignore: long-method
  static Route onGenerateRoute(RouteSettings settings) {
    // ignore: long-method
    switch (settings.name) {
      case '/home':
        return PageTransition<dynamic>(
          child: const HomeScreen(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
        );
      case '/splash':
        return PageTransition<dynamic>(
          child: const SplashScreen(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
        );
      case '/on-board':
        return PageTransition<dynamic>(
          child: const OnboardScreen(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
        );
      default:
        return PageTransition<dynamic>(
          child: const HomeScreen(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
        );
    }
  }
}
