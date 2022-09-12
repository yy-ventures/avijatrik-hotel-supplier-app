import 'package:avijatrik_hotel_supplier_app/blocs/bottom_navigation_bloc/bottom_navigation_bloc.dart';
import 'package:avijatrik_hotel_supplier_app/shared/utils/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/utils/style_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavigationBottom extends StatelessWidget {
  const NavigationBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      builder: (context, state) {
        return SafeArea(
          child: SizedBox(
            height: bottomNavHeight,
            child: BottomNavigationBar(
                currentIndex: state.screenIndex,
                onTap: ((index) {
                  context
                      .read<BottomNavigationBloc>()
                      .add(ChangeScreen(screenIndex: index));
                }),
                // to add more than 3 navigation item we need to set BottomNavigationBarType.type property to fixed
                type: BottomNavigationBarType.fixed,
                unselectedLabelStyle: const TextStyle(
                  color: greenLight,
                  fontSize: bottomNavigationLabelFontSize,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                ),
                unselectedItemColor: greenLight,
                selectedLabelStyle: const TextStyle(
                  color: primaryWhite,
                  fontSize: bottomNavigationLabelFontSize,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                ),
                selectedItemColor: primaryWhite,
                backgroundColor: brand,
                items: [
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(
                        bottom: bottomNavigationIconPadding,
                      ),
                      child:
                          SvgPicture.asset('assets/icons/navigation_home.svg'),
                    ),
                    activeIcon: Padding(
                      padding: const EdgeInsets.only(
                        bottom: bottomNavigationIconPadding,
                      ),
                      child: SvgPicture.asset(
                          'assets/icons/navigation_home_active.svg'),
                    ),
                    label: 'Home',
                    backgroundColor: whiteBackGroundColor,
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(
                        bottom: bottomNavigationIconPadding,
                      ),
                      child: SvgPicture.asset('assets/icons/profile.svg'),
                    ),
                    activeIcon: Padding(
                      padding: const EdgeInsets.only(
                        bottom: bottomNavigationIconPadding,
                      ),
                      child:
                          SvgPicture.asset('assets/icons/profile_active.svg'),
                    ),
                    label: 'Profile',
                    backgroundColor: whiteBackGroundColor,
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(
                        bottom: bottomNavigationIconPadding,
                      ),
                      child: SvgPicture.asset('assets/icons/bid_alert.svg'),
                    ),
                    activeIcon: Padding(
                      padding: const EdgeInsets.only(
                        bottom: bottomNavigationIconPadding,
                      ),
                      child:
                          SvgPicture.asset('assets/icons/bid_alert_active.svg'),
                    ),
                    label: 'Bid Alerts',
                    backgroundColor: whiteBackGroundColor,
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(
                        bottom: bottomNavigationIconPadding,
                      ),
                      child: SvgPicture.asset('assets/icons/help.svg'),
                    ),
                    activeIcon: Padding(
                      padding: const EdgeInsets.only(
                        bottom: bottomNavigationIconPadding,
                      ),
                      child: SvgPicture.asset('assets/icons/help_active.svg'),
                    ),
                    label: 'Help',
                    backgroundColor: whiteBackGroundColor,
                  ),
                ]),
          ),
        );
      },
    );
  }
}
