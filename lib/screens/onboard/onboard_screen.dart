import 'package:avijatrik_hotel_supplier_app/utils/index.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/appbar/appbar.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/custom/logo_with_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]);
    SizeUtils().init(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: brand,
      appBar: const CustomAppBar(
        elevation: 0,
        title: '',
        background: Colors.transparent,
        statusbarTransparent: true,
      ),
      body: Column(
        children: [
          ClipPath(
            clipper: CustomClipPath(),
            child: ShaderMask(
              shaderCallback: (bounds) {
                return LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: const Alignment(0, 1),
                  colors: [
                    primaryWhite,
                    Colors.white.withOpacity(0.6),
                    Colors.transparent,
                    Colors.transparent,
                    Colors.transparent,
                  ],
                ).createShader(bounds);
              },
              blendMode: BlendMode.srcATop,
              child: Image(
                image: const AssetImage('assets/images/bg-img.png'),
                fit: BoxFit.cover,
                height: SizeUtils.screenHeight * 0.65,
              ),
            ),
          ),
          const SizedBox(height: 15),
          const LogoWithTitle()
        ],
      ),
    );
  }
}

// Custom CLipping Path to clip the background Image
class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();
    path.lineTo(0, h / 1.1);
    path.quadraticBezierTo(w * 0.5, h + 40, w, h / 1.1);
    path.lineTo(w, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
