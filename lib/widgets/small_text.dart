import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final String text;
  final double size;
  final double height;
  final TextOverflow overflow;

  final Color? color;

  const SmallText({
    super.key,
    this.size = 12,
    this.height = 1.2,
    required this.text,
    this.color = const Color(0xFF332D2B),
    this.overflow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      // overflow: overflow,
      style: TextStyle(
        color: color,
        height: height,
        fontSize: size,
        fontFamily: 'Baloo2',
      ),
    );
  }
}
