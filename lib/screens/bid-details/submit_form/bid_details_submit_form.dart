import 'package:avijatrik_hotel_supplier_app/blocs/bid/submit/bid_submit_bloc.dart';
import 'package:avijatrik_hotel_supplier_app/models/room.dart';
import 'package:avijatrik_hotel_supplier_app/shared/models/http/error_info.dart';
import 'package:avijatrik_hotel_supplier_app/shared/utils/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/widgets/button/footer_button.dart';
import 'package:avijatrik_hotel_supplier_app/shared/widgets/custom/custom_rounded_text_field.dart';
import 'package:avijatrik_hotel_supplier_app/shared/widgets/custom/custom_text.dart';
import 'package:avijatrik_hotel_supplier_app/shared/widgets/custom/custom_text_field.dart';
import 'package:avijatrik_hotel_supplier_app/shared/widgets/error/error_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class BidDetailsSubmitForm extends StatelessWidget {
  BidDetailsSubmitForm({
    Key? key,
    required this.numberOfRoomsCtrl,
    required this.regularPriceCtrl,
    required this.offerPriceCtrl,
    required this.descriptionCtrl,
    required this.noteCtrl,
  }) : super(key: key);

  // Bloc
  late BidSubmitBloc _bidSubmitBloc;
  // Controllers
  final TextEditingController numberOfRoomsCtrl;
  final TextEditingController regularPriceCtrl;
  final TextEditingController offerPriceCtrl;
  final TextEditingController descriptionCtrl;
  final TextEditingController noteCtrl;

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);

    _bidSubmitBloc = BlocProvider.of<BidSubmitBloc>(context);

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

    return BlocBuilder<BidSubmitBloc, BidSubmitState>(
      builder: (context, state) {
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
                  child: _roomNameDropdownInputField(selectedRoom, roomNames),
                ),
                const SizedBox(height: 10),
                _numberOfRoomsInputField(),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: _regularPriceInputField(),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _offerPriceInputField(
                        state is BidSubmitOfferPriceInvalid ? true : false,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                state is BidSubmitOfferPriceInvalid
                    ? const Center(
                        child: ErrorText(
                          text:
                              'Offer Price must be less than the Regular Price',
                          centered: true,
                        ),
                      )
                    : const SizedBox(),
                _descriptionInputField(),
                const SizedBox(height: 15),
                _noteInputField(),
                const SizedBox(height: 42),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FooterButton(
                      text: 'Submit Bid',
                      onPressed: () {
                        print(regularPriceCtrl.text);
                      },
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
      },
    );
  }

  //* Input Fields Extracted as Functions

  // Dropdown Input Field For Room Name
  DropdownButtonHideUnderline _roomNameDropdownInputField(
    String selectedRoom,
    List<String> roomNames,
  ) {
    return DropdownButtonHideUnderline(
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
    );
  }

  // Input Field For Number of Rooms
  CustomRoundedTextField _numberOfRoomsInputField() {
    return CustomRoundedTextField(
      labelText: "Number Of Rooms",
      textController: numberOfRoomsCtrl,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(
          RegExp('[0-9]'),
        ),
        LengthLimitingTextInputFormatter(2),
      ],
    );
  }

  // Input Field For Regular Price
  CustomRoundedTextField _regularPriceInputField() {
    return CustomRoundedTextField(
      enabled: false,
      labelText: 'Regular Price',
      textController: regularPriceCtrl..text = '1000',
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(
          RegExp('^[1-9][0-9]*'),
        ),
      ],
    );
  }

  // Input Field For Offer Price
  CustomRoundedTextField _offerPriceInputField(bool error) {
    return CustomRoundedTextField(
      labelText: 'Offer Price',
      textController: offerPriceCtrl,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(
          RegExp('^[1-9][0-9]*'),
        ),
      ],
      onChange: (value) => _bidSubmitBloc.add(
        CheckOfferPriceIsValid(
          regularPrice: regularPriceCtrl.text,
          offerPrice: offerPriceCtrl.text,
        ),
      ),
      error: error,
    );
  }

  // Description input field
  CustomTextField _descriptionInputField() {
    return CustomTextField(
      labelText: 'Description',
      textController: descriptionCtrl,
    );
  }

  // Note Input Field
  CustomTextField _noteInputField() {
    return CustomTextField(
      labelText: 'Note',
      textController: noteCtrl,
    );
  }
}
