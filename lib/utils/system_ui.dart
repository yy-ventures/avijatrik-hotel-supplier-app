import 'package:avijatrik_hotel_supplier_app/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

SystemUiOverlayStyle transparentNavigation() {
  return const SystemUiOverlayStyle(
    systemNavigationBarContrastEnforced: true,
    systemNavigationBarColor: brand,
    systemNavigationBarDividerColor: brandShadow,
    systemNavigationBarIconBrightness: Brightness.dark,
  );
}
