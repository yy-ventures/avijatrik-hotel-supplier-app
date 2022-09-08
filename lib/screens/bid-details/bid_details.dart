import 'package:avijatrik_hotel_supplier_app/utils/color_utils.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/appbar/appbar.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/bid_info/bid_info.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/button/custom_radio_button.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/custom/custom_text.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/preference_container/preference_container.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/preference_tile/preference_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BidDetails extends StatefulWidget {
  const BidDetails({Key? key}) : super(key: key);

  @override
  State<BidDetails> createState() => _BidDetailsState();
}

class _BidDetailsState extends State<BidDetails> {
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
    ];

    return Scaffold(
      appBar: const CustomAppBar(title: 'Bid Details'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Expanded(
              child: Column(
                children: <Widget>[
                  const BidInfo(
                    center: true,
                    gap: 25,
                  ),
                  const SizedBox(height: 42),
                  PreferenceContainer(
                    heading: 'Primary Preference',
                    preferences: primaryPreferences,
                    hotelServices: primaryHotelServices,
                  ),
                  const BidInfo(
                    center: true,
                    gap: 25,
                  ),
                  const SizedBox(height: 42),
                  PreferenceContainer(
                    heading: 'Secondary Preference',
                    preferences: secondaryPreferences,
                    hotelServices: secondaryHotelServices,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
