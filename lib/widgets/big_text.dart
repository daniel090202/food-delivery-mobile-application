import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final String text;
  final double size;
  final TextOverflow overflow;

  final Color? color;

  const BigText({
    super.key,
    this.size = 20,
    required this.text,
    this.overflow = TextOverflow.ellipsis,
    this.color = const Color(0xFF332D2B),
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontFamily: 'Baloo2',
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
