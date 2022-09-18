import 'package:avijatrik_hotel_supplier_app/models/room.dart';
import 'package:avijatrik_hotel_supplier_app/shared/utils/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/widgets/button/footer_button.dart';
import 'package:avijatrik_hotel_supplier_app/shared/widgets/custom/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BidDetailsSubmitForm extends StatelessWidget {
  BidDetailsSubmitForm({Key? key}) : super(key: key);

  // Controllers
  // final roomNameCtrl = TextEditingController();
  // final numberOfRoomsCtrl = TextEditingController();
  final offerPriceCtrl = TextEditingController();
  // final descriptionCtrl = TextEditingController();
  // final noteCtrl = TextEditingController();

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

    return Container(
      constraints: BoxConstraints(minHeight: SizeUtils.screenHeight * 0.65),
      child: Center(
        child: Column(
          children: <Widget>[
            const CustomText(
              title: 'Your Bid',
              textColor: brand,
              fontSize: headerTextFontSIze,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: brand,
                  width: 1,
                  style: BorderStyle.solid,
                ),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: widgetHorizontalPadding,
                vertical: 0,
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedRoom,
                  alignment: AlignmentDirectional.center,
                  isExpanded: true,
                  icon: const Icon(Icons.expand_more_outlined),
                  iconSize: 28,
                  iconEnabledColor: brand,
                  items: roomNames
                      .map(
                        (item) => DropdownMenuItem<String>(
                          value: item,
                          child: Center(
                            child: CustomText(
                              title: item,
                              textColor: black50,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    print(value);
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              textAlign: TextAlign.center,
              textAlignVertical: TextAlignVertical.center,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(
                  RegExp('[1-9]'),
                ),
                LengthLimitingTextInputFormatter(2),
              ],
              cursorColor: brand,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(0),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: brand,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                label: const Center(
                  child: CustomText(
                    title: 'Number of rooms',
                    textColor: black50,
                  ),
                ),
                alignLabelWithHint: true,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    readOnly: true,
                    controller: TextEditingController()..text = '10',
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(8),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: brand,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      label: const CustomText(
                        title: 'Regular Price',
                        textColor: black50,
                      ),
                    ),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp('^[1-9][0-9]*'),
                      ),
                    ],
                    cursorColor: brand,
                    onChanged: (text) => {},
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    enabled: true,
                    controller: offerPriceCtrl,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: brand,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      label: const Center(
                        child: CustomText(
                          title: 'Offer Price',
                          textColor: black50,
                        ),
                      ),
                    ),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    cursorColor: brand,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp('^[1-9][0-9]'),
                      ),
                    ],
                    onChanged: (value) => {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: black50,
                  ),
                ),
                label: CustomText(
                  title: 'Description',
                  textColor: black50,
                ),
              ),
              textAlign: TextAlign.center,

              // obscureText: true,
              keyboardType: TextInputType.text,
              cursorColor: brand,
            ),
            const SizedBox(height: 15),
            const TextField(
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: black50,
                  ),
                ),
                label: CustomText(
                  title: 'Note',
                  textColor: black50,
                ),
              ),
              textAlign: TextAlign.center,

              // obscureText: true,
              keyboardType: TextInputType.text,
              cursorColor: brand,
            ),
            const SizedBox(height: 42),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FooterButton(
                  text: 'Submit Bid',
                  onPressed: () {},
                  height: 39,
                ),
                const SizedBox(width: 10),
                FooterButton(
                  text: 'Cancel Bid',
                  onPressed: () {},
                  height: 39,
                  color: redNotification,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
