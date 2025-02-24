import 'package:flutter/material.dart';
import 'package:food_delivery_mobile_application/utilities/dimensions.dart';

class AppIcon extends StatelessWidget {
  final double size;
  final double iconSize;

  final IconData icon;

  final Color iconColor;
  final Color backgroundColor;

  const AppIcon({
    super.key,
    this.size = 36.0,
    required this.icon,
    this.iconSize = 32.0,
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
          size: iconSize,
          color: iconColor,
        ),
      ),
    );
  }
}
