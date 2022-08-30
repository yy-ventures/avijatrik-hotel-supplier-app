import 'package:avijatrik_hotel_supplier_app/utils/index.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/custom/custom_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ServerErrorContainer extends StatelessWidget {
  ServerErrorContainer({
    Key? key,
    this.isPullRefresh = false,
    this.onRefresh,
  }) : super(key: key);

  final bool isPullRefresh;
  final Future<void> Function()? onRefresh;

  final double topPadding =
      ((SizeUtils.screenHeight - (SizeUtils.topPadding + appBarHeight)) / 2) -
          (160 + 20 + 30); //imageHeight + Gap

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      // ignore: avoid_returning_null_for_void
      onRefresh: isPullRefresh ? onRefresh! : () async => null,
      child: SingleChildScrollView(
        physics: isPullRefresh
            ? const AlwaysScrollableScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
            top: topPadding,
            left: screenLeftPadding + 30,
            right: screenRightPadding + 30,
          ),
          child: Column(
            children: [
              Image.asset(
                'images/no-internet-illustration.png',
                height: 160,
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomText(
                title: 'Oops! Something Went Wrong.',
                fontSize: 20,
                textColor: brand,
              ),
              const SizedBox(
                height: 16,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text:
                          'Please try again later. If the problem continues, please contact',
                      style: TextStyle(
                        color: black40,
                        fontSize: 14,
                      ),
                    ),
                    const TextSpan(
                      text: ' ',
                    ),
                    TextSpan(
                      text: 'customer support.',
                      style: const TextStyle(
                        color: primaryBlue,
                        fontSize: 14,
                        height: 1.5,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.pushNamed(context, '/help'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
