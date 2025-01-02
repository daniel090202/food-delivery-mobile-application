import 'package:flutter/material.dart';
import 'package:food_delivery_mobile_application/utilities/dimensions.dart';

class AppIcon extends StatelessWidget {
  final double size;

  final IconData icon;

  final Color iconColor;
  final Color backgroundColor;

  const AppIcon({
    super.key,
    this.size = 30.0,
    required this.icon,
    this.iconColor = const Color(0xFF756D54),
    this.backgroundColor = const Color(0xFFFCF4E4),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(size / 2.0),
      ),
      child: Center(
        child: Icon(
          icon,
          color: iconColor,
          size: Dimensions.width(32.0),
        ),
      ),
    );
  }
}
