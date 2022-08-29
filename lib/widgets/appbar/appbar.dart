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
  }) : super(key: key);

  final String title;
  final Color background;
  final double elevation;

  @override
  Size get preferredSize => const Size.fromHeight(appBarHeight);

  @override
  Widget build(BuildContext context) {
    // SizeUtils().init(context);

    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: primaryWhite,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          systemStatusBarContrastEnforced: true),
      elevation: elevation,
      backgroundColor: background,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: CustomText(
        title: title,
        textColor: brand,
      ),
    );
  }
}
