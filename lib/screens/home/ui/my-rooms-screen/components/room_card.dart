import 'package:avijatrik_hotel_supplier_app/shared/utils/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/widgets/custom/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RoomCard extends StatelessWidget {
  const RoomCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: IntrinsicHeight(
        child: Container(
          decoration: BoxDecoration(
            color: white80,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/rooms_svg.svg',
                    ),
                    SizedBox(width: 15),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        CustomText(
                          title: 'Standard Suite',
                          textColor: black50,
                          fontSize: roomCardHeadingFontSize,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomText(
                          title: '02 Person(s)',
                          textColor: black50,
                          fontSize: roomCardDetailFontSize,
                          fontWeight: FontWeight.w500,
                        ),
                        CustomText(
                          title: 'Price: 2000 BDT /night',
                          textColor: black50,
                          fontSize: roomCardDetailFontSize,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      color: primaryWhite,
                      borderRadius: BorderRadius.circular(15)),
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 12.0),
                    child: CustomText(
                      title: '10',
                      textColor: brand,
                      fontSize: roomCardCountFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
