import 'package:avijatrik_hotel_supplier_app/l10n/l10n.dart';
import 'package:avijatrik_hotel_supplier_app/screens/bid-alerts/bid_alerts.dart';
import 'package:avijatrik_hotel_supplier_app/screens/help/help.dart';
import 'package:avijatrik_hotel_supplier_app/screens/home/home_screen.dart';
import 'package:avijatrik_hotel_supplier_app/screens/profile/profile.dart';
import 'package:avijatrik_hotel_supplier_app/utils/color_utils.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/appbar/appbar.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Layout extends StatefulWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  final screens = [
    const HomeScreen(),
    const ProfileScreen(),
    const BidAlertScreen(),
    const HelpScreen(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: AppLocalizations.of(context)!.appbarTitle),
      body: screens[_currentIndex],
      bottomNavigationBar: SizedBox(
        height: 100,
        child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: ((index) => setState(() => _currentIndex = index)),
            // to add more than 3 navigation item we need to set BottomNavigationBarType.type property to fixed
            type: BottomNavigationBarType.fixed,
            unselectedLabelStyle: const TextStyle(
              color: navigationLabelInactive,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            unselectedItemColor: navigationLabelInactive,
            selectedLabelStyle: const TextStyle(
              color: primaryWhite,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            selectedItemColor: primaryWhite,
            backgroundColor: brand,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/navigation_home.svg'),
                activeIcon:
                    SvgPicture.asset('assets/icons/navigation_home_active.svg'),
                label: 'Home',
                backgroundColor: whiteBackGroundColor,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/profile.svg'),
                activeIcon: SvgPicture.asset('assets/icons/profile_active.svg'),
                label: 'Profile',
                backgroundColor: whiteBackGroundColor,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/bid_alert.svg'),
                activeIcon:
                    SvgPicture.asset('assets/icons/bid_alert_active.svg'),
                label: 'Bid Alerts',
                backgroundColor: whiteBackGroundColor,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/help.svg'),
                activeIcon: SvgPicture.asset('assets/icons/help_active.svg'),
                label: 'Help',
                backgroundColor: whiteBackGroundColor,
              ),
            ]),
      ),
    );
  }
}
