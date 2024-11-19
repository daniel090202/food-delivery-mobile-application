import 'package:flutter/material.dart';
import 'package:food_delivery_mobile_application/widgets/small_text.dart';

class TextWithIcon extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color textColor;
  final Color iconColor;

  const TextWithIcon({
    super.key,
    required this.icon,
    required this.text,
    this.textColor = const Color(0xFFCCC7C5),
    this.iconColor = const Color(0xFF89DAD0),
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor),
        SizedBox(
          width: 5,
        ),
        SmallText(
          text: text,
          color: textColor,
        )
      ],
    );
  }
}
