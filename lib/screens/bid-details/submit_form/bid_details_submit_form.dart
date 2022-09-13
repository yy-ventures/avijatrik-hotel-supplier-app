import 'package:avijatrik_hotel_supplier_app/shared/utils/color_utils.dart';
import 'package:avijatrik_hotel_supplier_app/shared/utils/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/widgets/button/footer_button.dart';
import 'package:avijatrik_hotel_supplier_app/shared/widgets/custom/custom_text.dart';
import 'package:flutter/material.dart';

class BidDetailsSubmitForm extends StatelessWidget {
  const BidDetailsSubmitForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double widgetHorizontalPadding = 30;

    return Container(
      constraints: const BoxConstraints(minHeight: 450),
      child: Center(
        child: Column(
          children: <Widget>[
            const CustomText(
              title: 'Your Bid',
              textColor: brand,
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
                  alignment: AlignmentDirectional.center,
                  isExpanded: true,
                  borderRadius: BorderRadius.circular(20),
                  items: const [
                    DropdownMenuItem<String>(
                      child: Center(
                        child: CustomText(
                          title: 'Select Options',
                          textColor: black50,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                  icon: const Icon(Icons.expand_more_outlined),
                  iconSize: 28,
                  iconEnabledColor: brand,
                  onChanged: (value) {},
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
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
                          title: 'Regular Price',
                          textColor: black50,
                        ),
                      ),
                    ),
                    textAlign: TextAlign.center,

                    // obscureText: true,
                    keyboardType: TextInputType.number,
                    cursorColor: brand,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
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

                    // obscureText: true,
                    keyboardType: TextInputType.number,
                    cursorColor: brand,
                  ),
                ),
              ],
            ),
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
              keyboardType: TextInputType.number,
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
                const SizedBox(width: 11),
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
