import 'package:flutter/material.dart';

import '../../utils/index.dart';

class ImageWithShader extends StatelessWidget {
  const ImageWithShader(
      {Key? key,
      required this.imagePath,
      required this.heightInPercentage,
      this.symmetricShader = false})
      : super(key: key);

  final String imagePath;
  final double heightInPercentage;
  final bool symmetricShader;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return symmetricShader
            ? mirrorGradient.createShader(bounds)
            : linearGradient.createShader(bounds);
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
