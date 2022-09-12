import 'package:animations/animations.dart';
import 'package:avijatrik_hotel_supplier_app/blocs/bottom_navigation_bloc/bottom_navigation_bloc.dart';
import 'package:avijatrik_hotel_supplier_app/l10n/l10n.dart';
import 'package:avijatrik_hotel_supplier_app/screens/bid-alerts/bid_alerts.dart';
import 'package:avijatrik_hotel_supplier_app/screens/help/help.dart';
import 'package:avijatrik_hotel_supplier_app/screens/home/home_screen.dart';
import 'package:avijatrik_hotel_supplier_app/screens/profile/profile.dart';
import 'package:avijatrik_hotel_supplier_app/shared/widgets/appbar/appbar.dart';
import 'package:avijatrik_hotel_supplier_app/shared/widgets/navigation/navigation_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Layout extends StatefulWidget {
  const Layout({Key? key, this.initialIndex = 0}) : super(key: key);
  final int initialIndex;

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  final List<Widget> screens = <Widget>[
    const HomeScreen(),
    const ProfileScreen(),
    const BidAlertScreen(),
    const HelpScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavigationBloc(),
      child: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar:
                CustomAppBar(title: AppLocalizations.of(context)!.appbarTitle),
            body: PageTransitionSwitcher(
              transitionBuilder:
                  ((child, primaryAnimation, secondaryAnimation) =>
                      FadeThroughTransition(
                        animation: primaryAnimation,
                        secondaryAnimation: secondaryAnimation,
                        child: child,
                      )),
              child: IndexedStack(
                index: state.screenIndex,
                children: screens,
              ),
            ),
            bottomNavigationBar: NavigationBottom(),
          );
        },
      ),
    );
  }
}
