import 'package:avijatrik_hotel_supplier_app/utils/index.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/custom/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    // SizeUtils().init(context);

    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor:
              statusbarTransparent ? Colors.transparent : primaryWhite,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          systemStatusBarContrastEnforced: !statusbarTransparent),
      elevation: elevation,
      backgroundColor: statusbarTransparent ? Colors.transparent : background,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: CustomText(
        title: title,
        textColor: brand,
      ),
    );
  }
}
