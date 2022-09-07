import 'package:avijatrik_hotel_supplier_app/screens/my-rooms-screen/components/room_card.dart';
import 'package:avijatrik_hotel_supplier_app/utils/color_utils.dart';
import 'package:avijatrik_hotel_supplier_app/utils/index.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/custom/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyRoomsScreen extends StatelessWidget {
  const MyRoomsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 15),
        const CustomText(
          title: 'Available Rooms',
          textColor: black50,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        const SizedBox(height: 15),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const <Widget>[
                  RoomCard(),
                  RoomCard(),
                  RoomCard(),
                  RoomCard(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
