import 'package:avijatrik_hotel_supplier_app/screens/index.dart';
import 'package:avijatrik_hotel_supplier_app/screens/layout/layout.dart';
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

      case '/login':
        return PageTransition<dynamic>(
          child: const LoginScreen(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
        );
      case '/otp':
        final params = settings.arguments! as Map<String, dynamic>;

        return PageTransition<dynamic>(
          child: OtpScreen(phoneNumber: params['phoneNumber']),
          type: PageTransitionType.rightToLeft,
          settings: settings,
        );
      case '/home':
        return PageTransition<dynamic>(
          child: const Layout(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
        );
      default:
        return PageTransition<dynamic>(
          child: const SplashScreen(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
        );
    }
  }
}
