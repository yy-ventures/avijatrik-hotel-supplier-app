import 'package:avijatrik_hotel_supplier_app/shared/blocs/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/utils/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/widgets/custom/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.title = '',
    this.background = primaryWhite,
    this.elevation = 10,
    this.statusbarTransparent = false,
    this.logo = true,
  }) : super(key: key);

  final String title;
  final Color background;
  final double elevation;
  final bool statusbarTransparent;
  final bool logo;

  @override
  Size get preferredSize => const Size.fromHeight(appBarHeight);

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);

    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, state) {
        return AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor:
                statusbarTransparent ? Colors.transparent : primaryWhite,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
            systemStatusBarContrastEnforced: !statusbarTransparent,
          ),
          elevation: elevation,
          shadowColor: shadowAppBar,
          backgroundColor:
              statusbarTransparent ? Colors.transparent : background,
          automaticallyImplyLeading: false,
          centerTitle: true,
          toolbarHeight: appBarHeight,
          title: SizedBox(
            width: SizeUtils.screenWidth,
            height: appBarHeight,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                logo
                    ? const SizedBox()
                    : Positioned(
                        left: 0,
                        child: GestureDetector(
                          onTap: (() => Navigator.pop(context)),
                          child: Container(
                            color: Colors.transparent,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 34, vertical: 12.0),
                              child: SvgPicture.asset(
                                'assets/icons/back.svg',
                                width: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                logo
                    ? Positioned(
                        child: SvgPicture.asset(
                          'assets/logos/avijatrik_logo_green.svg',
                        ),
                      )
                    : CustomText(
                        title: title,
                        textColor: brand,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                Positioned(
                  right: 0,
                  child: FlutterSwitch(
                    valueFontSize: 20,
                    showOnOff: true,
                    activeColor: brand,
                    activeText: 'BN',
                    activeTextColor: primaryWhite,
                    inactiveColor: primaryBlue,
                    inactiveText: 'EN',
                    inactiveTextColor: primaryWhite,
                    value: state.toggle,
                    onToggle: ((value) => context.read<LanguageBloc>().add(
                          ChangeLanguage(
                            toggle: value,
                            languageCode: value == false ? 'en' : 'bn',
                          ),
                        )),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
