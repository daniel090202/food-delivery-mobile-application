import 'package:flutter/material.dart';
import 'package:food_delivery_mobile_application/widgets/small_text.dart';
import 'package:food_delivery_mobile_application/utilities/dimensions.dart';

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
        Icon(
          icon,
          color: iconColor,
          size: Dimensions.width(36.0),
        ),
        SizedBox(
          width: 5,
        ),
        SmallText(
          text: text,
          color: textColor,
          size: Dimensions.height(20.0),
        )
      ],
    );
  }
}
