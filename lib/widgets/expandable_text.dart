import 'package:flutter/material.dart';
import 'package:food_delivery_mobile_application/themes/colors.dart';
import 'package:food_delivery_mobile_application/utilities/dimensions.dart';
import 'package:food_delivery_mobile_application/widgets/small_text.dart';

class ExpandableText extends StatefulWidget {
  final String content;

  const ExpandableText({
    super.key,
    required this.content,
  });

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenContent = true;

  double textHeight = Dimensions.screenHeight / 6.0;

  @override
  void initState() {
    super.initState();

    if (widget.content.length > textHeight) {
      firstHalf = widget.content.substring(
        0,
        textHeight.toInt(),
      );

      secondHalf = widget.content.substring(
        textHeight.toInt() + 1,
        widget.content.length,
      );
    } else {
      firstHalf = widget.content;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(text: firstHalf)
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SmallText(
                  text: hiddenContent
                      ? ("$firstHalf...")
                      : (firstHalf + secondHalf),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenContent = !hiddenContent;
                    });
                  },
                  child: Row(
                    children: [
                      SmallText(
                        text: "Show more",
                        color: AppColors.primaryColor,
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: AppColors.primaryColor,
                      ),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}