import 'package:avijatrik_hotel_supplier_app/blocs/bottom_navigation_bloc/bottom_navigation_bloc.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/appbar/appbar.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/bid_info/bid_info.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/navigation/navigation_bottom.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/preference_container/preference_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      ),
    );
  }
}
