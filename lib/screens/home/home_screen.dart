import 'package:avijatrik_hotel_supplier_app/screens/my-bids-screen/my_bids_screen.dart';
import 'package:avijatrik_hotel_supplier_app/screens/my-rooms-screen/my_rooms_screen.dart';
import 'package:avijatrik_hotel_supplier_app/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

    return const MyRoomsScreen();
  }
}
