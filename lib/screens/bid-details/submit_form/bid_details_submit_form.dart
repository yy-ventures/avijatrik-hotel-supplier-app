import 'package:avijatrik_hotel_supplier_app/shared/utils/color_utils.dart';
import 'package:avijatrik_hotel_supplier_app/shared/widgets/custom/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sms_autofill/sms_autofill.dart';

class BidDetailsSubmitForm extends StatelessWidget {
  const BidDetailsSubmitForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 450),
      child: Center(
        child: Column(
          children: <Widget>[
            const CustomText(
              title: 'Your Bid',
              textColor: brand,
              fontWeight: FontWeight.bold,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: brand,
                    width: 1,
                    style: BorderStyle.solid,
                  )),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  alignment: AlignmentDirectional.center,
                  iconSize: 50,
                  isExpanded: true,
                  borderRadius: BorderRadius.circular(20),
                  items: const [
                    DropdownMenuItem<String>(
                      child: CustomText(
                        title: 'Select Options',
                        textColor: black50,
                        fontSize: 20,
                      ),
                    ),
                  ],
                  onChanged: (value) {},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
