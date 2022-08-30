import 'package:avijatrik_hotel_supplier_app/shared/login/ui/components/index.dart';
import 'package:avijatrik_hotel_supplier_app/utils/index.dart';
import 'package:flutter/material.dart';

class HeaderContainer extends StatelessWidget {
  const HeaderContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            // ClipPath(
            //   clipper: IllustrationClipPath(),
            //   child: CustomIllustration(
            //     width: double.infinity,
            //     height: SizeUtils.screenHeight * 0.30,
            //     fit: BoxFit.cover,
            //     src: 'images/auth.jpg',
            //   ),
            // ),
            Positioned(
              left: screenLeftPadding,
              top: SizeUtils.topPadding + screenTopPadding,
              child: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                splashRadius: iconSplashRadius,
                icon: const Icon(Icons.abc_outlined),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
        Transform(
          transform: Matrix4.translationValues(0, 0, 0),
          child: const Center(
              // child: CustomIllustration(
              //   src: 'logo/app-logo-dark.png',
              //   height: 160,
              //   width: 160,
              // ),
              ),
        ),
      ],
    );
  }
}
