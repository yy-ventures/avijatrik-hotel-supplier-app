import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

SystemUiOverlayStyle transparentNavigation() {
  return const SystemUiOverlayStyle(
    systemNavigationBarContrastEnforced: true,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
  );
}
