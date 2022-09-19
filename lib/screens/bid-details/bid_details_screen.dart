import 'package:avijatrik_hotel_supplier_app/blocs/bid/submit/bid_submit_bloc.dart';
import 'package:avijatrik_hotel_supplier_app/models/room.dart';
import 'package:avijatrik_hotel_supplier_app/screens/bid-details/submit_form/bid_details_submit_form.dart';
import 'package:avijatrik_hotel_supplier_app/shared/services/bid_service.dart';
import 'package:avijatrik_hotel_supplier_app/shared/utils/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/widgets/appbar/appbar.dart';
import 'package:avijatrik_hotel_supplier_app/shared/widgets/bid_info/bid_info_widget.dart';
import 'package:avijatrik_hotel_supplier_app/shared/widgets/preference_container/preference_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BidDetailsScreen extends StatelessWidget {
  BidDetailsScreen({Key? key}) : super(key: key);

  final regularPriceCtrl = TextEditingController();
  final offerPriceCtrl = TextEditingController();
  final numberOfRoomsCtrl = TextEditingController();
  final descriptionCtrl = TextEditingController();
  final noteCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);

    const double widgetHorizontalPadding = 30;

    // Dummy Data
    List<Room> rooms = [
      Room(id: 1, name: 'Deluxe Room'),
      Room(id: 2, name: 'Deluxe Couple'),
      Room(id: 3, name: 'Single Room'),
    ];

    List<String> roomNames =
        rooms.map((item) => item.name ?? 'Select Options').toList();

    String selectedRoom = roomNames[0];
    // Dummy Data

    const double gap = 25;
    final List<String> primaryPreferences = [
      'AC',
      'Complimentary Breakfast',
      'Bathtub',
      'King-size Bed',
      'Car Parking',
    ];
    final List<String> primaryHotelServices = [
      'AC',
      'Breakfast',
      'King-size Bed',
      'Lobby',
      'Balcony',
      'Room Service',
      'Mini Bar',
      'Car Parking',
      'Pool',
      'Work Desk'
    ];
    final List<String> secondaryPreferences = [
      'AC',
      'Complimentary Breakfast',
      'Bathtub',
      'King-size Bed',
      'Car Parking',
    ];
    final List<String> secondaryHotelServices = [
      'AC',
      'Breakfast',
      'King-size Bed',
      'Lobby',
      'Balcony',
      'Room Service',
      'Mini Bar',
      'Car Parking',
      'Pool',
      'Work Desk'
    ];

    return BlocProvider(
      create: (context) => BidSubmitBloc(bidService: BidService()),
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Bid Details',
          logo: false,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  child: ClipPath(
                    clipper: CustomClipPath(),
                    child: Container(
                      width: SizeUtils.screenWidth,
                      height: SizeUtils.screenHeight * 0.7,
                      color: lightGrey,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Expanded(
                      child: Column(
                        children: <Widget>[
                          const BidInfoWidget(
                            center: true,
                            gap: 25,
                          ),
                          const SizedBox(height: 42),
                          PreferenceContainer(
                            heading: 'Primary Preference',
                            preferences: primaryPreferences,
                            hotelServices: primaryHotelServices,
                          ),
                          const BidInfoWidget(
                            center: true,
                            gap: 25,
                          ),
                          const SizedBox(height: 42),
                          PreferenceContainer(
                            heading: 'Secondary Preference',
                            preferences: secondaryPreferences,
                            hotelServices: secondaryHotelServices,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: BidDetailsSubmitForm(
                              numberOfRoomsCtrl: numberOfRoomsCtrl,
                              regularPriceCtrl: regularPriceCtrl,
                              offerPriceCtrl: offerPriceCtrl,
                              descriptionCtrl: descriptionCtrl,
                              noteCtrl: noteCtrl,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Custom CLipping Path to clip the background Container
class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();
    path.lineTo(0, h);

    path.lineTo(w, h);
    path.lineTo(w, 0);
    path.quadraticBezierTo(
      w / 2,
      h * 0.125,
      0,
      0,
    );
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
