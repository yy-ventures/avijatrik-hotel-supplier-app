import 'package:avijatrik_hotel_supplier_app/l10n/l10n.dart';
import 'package:avijatrik_hotel_supplier_app/screens/layout/layout.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/appbar/appbar.dart';

import 'package:avijatrik_hotel_supplier_app/utils/index.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
// Setting System UI Styles
    SystemChrome.setSystemUIOverlayStyle(transparentNavigation());
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge,
        overlays: [SystemUiOverlay.top]);

    // Initializing the SizeUtils Custom Class
    SizeUtils().init(context);

    return Container(
      color: Colors.amber,
    );
  }
}
