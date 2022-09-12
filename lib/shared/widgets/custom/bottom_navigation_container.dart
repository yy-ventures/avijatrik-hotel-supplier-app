import 'package:avijatrik_hotel_supplier_app/shared/utils/style_utils.dart';
import 'package:flutter/material.dart';

class BottomNavigationContainer extends StatelessWidget {
  const BottomNavigationContainer({
    Key? key,
    required this.child,
    this.topPadding = 0,
    this.leftPadding = screenLeftPadding,
    this.bottomPadding = screenBottomPadding,
    this.rightPadding = screenRightPadding,
    this.color,
  }) : super(key: key);

  final Widget child;
  final double topPadding;
  final double leftPadding;
  final double bottomPadding;
  final double rightPadding;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: color,
      child: Padding(
        padding: EdgeInsets.only(
          top: topPadding,
          left: leftPadding,
          right: rightPadding,
          bottom: bottomPadding,
        ),
        child: child,
      ),
    );
  }
}
