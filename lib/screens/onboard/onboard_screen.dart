import 'package:avijatrik_hotel_supplier_app/utils/index.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/appbar/appbar.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/custom/logo_with_title.dart';
import 'package:avijatrik_hotel_supplier_app/widgets/image_with_shader/image_with_shader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Setting System UI Styles
    SystemChrome.setSystemUIOverlayStyle(transparentNavigation());
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge,
        overlays: [SystemUiOverlay.top]);

    // Initializing the SizeUtils Custom Class
    SizeUtils().init(context);

    // UI
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: brand,
      appBar: const CustomAppBar(
        statusbarTransparent: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          ClipPath(
            clipper: CustomClipPath(),
            child: const ImageWithShader(
              imagePath: 'assets/images/bg-img.png',
              heightInPercentage: 65,
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
