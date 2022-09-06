import 'package:avijatrik_hotel_supplier_app/utils/color_utils.dart';
import 'package:avijatrik_hotel_supplier_app/utils/index.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/button/footer_button.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/custom/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);

    return Container(
      color: primaryWhite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              ClipPath(
                clipper: CustomClipPath(),
                child: Container(
                  height: SizeUtils.screenHeight * 0.31,
                  color: brand,
                ),
              ),
              Positioned(
                top: SizeUtils.screenHeight * 0.1,
                child: const CircleAvatar(
                  backgroundColor: greenLight,
                  radius: avatarRadius,
                  child: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/profile-img.png'),
                    radius: avatarRadius - 5,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: screenLeftPadding + 30,
              vertical: screenTopPadding + 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(
                  title: 'Name',
                  textColor: primaryBlack,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
                const SizedBox(
                  height: 3,
                ),
                const CustomText(
                  title: 'Rifah Nanziba',
                  textColor: primaryBlack,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 1,
                  color: brand,
                ),
                const SizedBox(
                  height: 15,
                ),
                const CustomText(
                  title: 'Hotel',
                  textColor: primaryBlack,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
                const SizedBox(
                  height: 3,
                ),
                const CustomText(
                  title: "Dolphin's Den",
                  textColor: primaryBlack,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 1,
                  color: brand,
                ),
                const SizedBox(
                  height: 15,
                ),
                const CustomText(
                  title: 'User ID',
                  textColor: primaryBlack,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
                const SizedBox(
                  height: 3,
                ),
                const CustomText(
                  title: '1998',
                  textColor: primaryBlack,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 42,
                ),
                Center(
                  child: FooterButton(
                    height: 40,
                    text: 'Sign Out',
                    color: lightGrey,
                    textColor: black50,
                    onPressed: () {},
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();
    path.lineTo(0, h / 1.6);
    path.quadraticBezierTo(w * 0.5, h / 1.2, w, h / 1.6);
    path.lineTo(w, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
