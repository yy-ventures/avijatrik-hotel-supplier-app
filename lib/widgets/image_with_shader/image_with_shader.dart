import 'package:flutter/material.dart';

import '../../utils/index.dart';

class ImageWithShader extends StatelessWidget {
  const ImageWithShader(
      {Key? key,
      required this.imagePath,
      required this.heightInPercentage,
      required this.gradient})
      : super(key: key);

  final String imagePath;
  final double heightInPercentage;
  final LinearGradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return gradient.createShader(bounds);
      },
      blendMode: BlendMode.screen,
      child: Image(
        image: AssetImage(imagePath),
        fit: BoxFit.cover,
        width: SizeUtils.screenWidth,
        height: SizeUtils.screenHeight * (heightInPercentage / 100),
      ),
    );
  }
}
