import 'package:avijatrik_hotel_supplier_app/shared/blocs/index.dart';
import 'package:avijatrik_hotel_supplier_app/utils/index.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/custom/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rolling_switch/rolling_switch.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.title = '',
    this.background = primaryWhite,
    this.elevation = 10,
    this.statusbarTransparent = false,
  }) : super(key: key);

  final String title;
  final Color background;
  final double elevation;
  final bool statusbarTransparent;

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
          title: Container(
            width: SizeUtils.screenWidth,
            height: appBarHeight,
            child: Stack(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.center,
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  bottom: 25,
                  child: CustomText(
                    title: title,
                    textColor: brand,
                    fontSize: SizeUtils.screenWidth / 25 + 8,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 25,
                  child: RollingSwitch.icon(
                    width: 78,
                    height: 30,
                    innerSize: 24,
                    rollingInfoRight: const RollingIconInfo(
                        icon: Icons.flag,
                        text: Text('BN'),
                        backgroundColor: brand),
                    rollingInfoLeft: const RollingIconInfo(
                      icon: Icons.check,
                      backgroundColor: Colors.blue,
                      text: Text('EN'),
                    ),
                    onChanged: (value) {
                      context.read<LanguageBloc>().add(ChangeLanguage(
                          toggle: value,
                          languageCode: value == false ? 'en' : 'bn'));
                    },
                  )
                  // CupertinoSwitch(
                  //   value: state.toggle,
                  //   onChanged: (value) {
                  //     context.read<LanguageBloc>().add(ChangeLanguage(
                  //         toggle: value,
                  //         languageCode: value == false ? 'en' : 'bn'));
                  //   },
                  //   activeColor: brand,
                  // )
                  ,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
