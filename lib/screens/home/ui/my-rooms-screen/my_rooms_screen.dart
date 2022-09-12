import 'package:avijatrik_hotel_supplier_app/screens/home/ui/my-rooms-screen/components/room_card.dart';
import 'package:avijatrik_hotel_supplier_app/shared/utils/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/widgets/custom/custom_text.dart';
import 'package:flutter/cupertino.dart';

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
