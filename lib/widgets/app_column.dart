import 'package:flutter/material.dart';
import 'package:food_delivery_mobile_application/themes/colors.dart';
import 'package:food_delivery_mobile_application/utilities/dimensions.dart';
import 'package:food_delivery_mobile_application/widgets/big_text.dart';
import 'package:food_delivery_mobile_application/widgets/small_text.dart';
import 'package:food_delivery_mobile_application/widgets/text_with_icon.dart';

class AppColumn extends StatelessWidget {
  final String title;

  const AppColumn({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: title,
          size: Dimensions.height(32.0),
        ),
        SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Wrap(
              children: List.generate(
                  5,
                  (index) => Icon(
                        Icons.star,
                        size: Dimensions.width(24.0),
                        color: AppColors.primaryColor,
                      )),
            ),
            SizedBox(width: 12),
            SmallText(
              text: "4.5",
              color: AppColors.disabledColor,
            ),
            SizedBox(width: 4),
            SmallText(
              text: "1287 comments",
              color: AppColors.disabledColor,
            ),
          ],
        ),
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextWithIcon(
              text: "Normal",
              icon: Icons.circle_sharp,
              iconColor: AppColors.iconColor,
            ),
            TextWithIcon(
              text: "1.7 km",
              icon: Icons.location_on,
              iconColor: AppColors.primaryColor,
            ),
            TextWithIcon(
              text: "32 min",
              iconColor: AppColors.redColor,
              icon: Icons.access_time_rounded,
            )
          ],
        )
      ],
    );
  }
}
