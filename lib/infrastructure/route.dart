import 'package:avijatrik_hotel_supplier_app/screens/home/home_screen.dart';
import 'package:avijatrik_hotel_supplier_app/screens/onboard/onboard_screen.dart';
import 'package:avijatrik_hotel_supplier_app/screens/sign-in/sign_in_screen.dart';
import 'package:avijatrik_hotel_supplier_app/screens/splash/splash_screen.dart';
import 'package:avijatrik_hotel_supplier_app/shared/login/ui/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class AppRoute {
  // ignore: long-method
  static Route onGenerateRoute(RouteSettings settings) {
    // ignore: long-method
    switch (settings.name) {
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
      case '/home':
        return PageTransition<dynamic>(
          child: const HomeScreen(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
        );
      case '/sign-in':
        return PageTransition<dynamic>(
          child: const LoginScreen(),
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
