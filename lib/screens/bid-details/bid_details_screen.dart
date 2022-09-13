import 'package:avijatrik_hotel_supplier_app/screens/bid-details/submit_form/bid_details_submit_form.dart';
import 'package:avijatrik_hotel_supplier_app/shared/utils/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/widgets/appbar/appbar.dart';
import 'package:avijatrik_hotel_supplier_app/shared/widgets/bid_info/bid_info_widget.dart';
import 'package:avijatrik_hotel_supplier_app/shared/widgets/preference_container/preference_container.dart';
import 'package:flutter/material.dart';

class BidDetailsScreen extends StatefulWidget {
  const BidDetailsScreen({Key? key}) : super(key: key);

  @override
  State<BidDetailsScreen> createState() => _BidDetailsScreenState();
}

class _BidDetailsScreenState extends State<BidDetailsScreen> {
  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
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
                    height: 450,
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
                        const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: BidDetailsSubmitForm(),
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
