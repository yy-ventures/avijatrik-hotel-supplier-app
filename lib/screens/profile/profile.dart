import 'dart:convert';
import 'package:flutter/material.dart';
//* Blocs
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:avijatrik_hotel_supplier_app/shared/blocs/auth/auth_bloc.dart';
import 'package:avijatrik_hotel_supplier_app/shared/blocs/auth/auth_event.dart';
//* Widgets
import 'package:avijatrik_hotel_supplier_app/shared/widgets/custom/custom_text.dart';
import 'package:avijatrik_hotel_supplier_app/shared/widgets/button/footer_button.dart';
// Utils
import 'package:avijatrik_hotel_supplier_app/shared/utils/index.dart';
//* Constants
import 'package:avijatrik_hotel_supplier_app/shared/constants/app_keys.dart';
import 'package:avijatrik_hotel_supplier_app/shared/constants/app_local_tables.dart';
//* DB,Enum,Helpers
import 'package:avijatrik_hotel_supplier_app/shared/db/index.dart';
import 'package:avijatrik_hotel_supplier_app/shared/enum/enums.dart';
import 'package:avijatrik_hotel_supplier_app/shared/helpers/auth_helper.dart';
//* Models
import 'package:avijatrik_hotel_supplier_app/shared/models/index.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);

    final user = DbHelper.getData(Tables.userInfo, AppKeys.userInfo);

    // Mapping Data from the table to User Model
    User userInfo = User.fromJson(jsonDecode(user));

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
                child: IntrinsicHeight(
                  child: Container(
                    height: SizeUtils.screenHeight * 0.27,
                    color: brand,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: CircleAvatar(
                  backgroundColor: greenLight,
                  radius: avatarRadius,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      userInfo.profileImage ?? '',
                    ),
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
                CustomText(
                  title: '${userInfo.firstName} ${userInfo.lastName}',
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
                CustomText(
                  title: userInfo.id.toString(),
                  textColor: primaryBlack,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 34,
                ),
                Center(
                  child: FooterButton(
                    height: 40,
                    text: 'Sign Out',
                    color: lightGrey,
                    textColor: black50,
                    onPressed: () {
                      Navigator.pop(context);
                      BlocProvider.of<AuthBloc>(context).add(
                        const ChangeAuthStatus(
                          authenticationStatus:
                              AuthenticationStatus.unAuthenticated,
                        ),
                      );
                      AuthHelper.logOut();
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        '/login',
                        (Route<dynamic> route) => false,
                      );
                    },
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
    path.quadraticBezierTo(w * 0.5, h / 1.25, w, h / 1.6);
    path.lineTo(w, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
