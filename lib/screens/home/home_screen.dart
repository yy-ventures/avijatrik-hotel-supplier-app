import 'package:avijatrik_hotel_supplier_app/blocs/home_bloc/home_bloc.dart';
import 'package:avijatrik_hotel_supplier_app/screens/my-bids-screen/my_bids_screen.dart';
import 'package:avijatrik_hotel_supplier_app/screens/my-rooms-screen/my_rooms_screen.dart';
import 'package:avijatrik_hotel_supplier_app/utils/index.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/custom/custom_text.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/home_navigation/home_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

    List<Widget> screens = <Widget>[
      const MyBidsScreen(),
      const MyRoomsScreen(),
    ];

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
      ],
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(
              screenAllSidePadding,
              0,
              screenAllSidePadding,
              0,
            ),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 25),
                const CustomText(
                  title: 'Hotel The Cox Today',
                  textColor: brand,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 25),
                const HomeNavigation(),
                Expanded(
                  child: IndexedStack(
                    index:
                        state is HomeScreenIndexState ? state.screenIndex : 0,
                    children: screens,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
