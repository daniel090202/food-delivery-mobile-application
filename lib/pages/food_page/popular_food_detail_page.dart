import 'package:flutter/material.dart';
import 'package:food_delivery_mobile_application/themes/colors.dart';
import 'package:food_delivery_mobile_application/widgets/app_icon.dart';
import 'package:food_delivery_mobile_application/widgets/big_text.dart';
import 'package:food_delivery_mobile_application/widgets/app_column.dart';
import 'package:food_delivery_mobile_application/utilities/dimensions.dart';
import 'package:food_delivery_mobile_application/widgets/expandable_text.dart';

class PopularFoodDetailPage extends StatelessWidget {
  const PopularFoodDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.height(400.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/food0.png"),
                ),
              ),
            ),
          ),
          Positioned(
            top: Dimensions.height(65.0),
            left: Dimensions.width(20.0),
            right: Dimensions.width(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back_ios,
                ),
                AppIcon(
                  icon: Icons.shopping_bag_outlined,
                )
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.height(400.0 - 20.0),
            child: Container(
              padding: EdgeInsets.only(
                top: Dimensions.height(15.0),
                left: Dimensions.height(20.0),
                right: Dimensions.height(20.0),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.width(42.0)),
                  topRight: Radius.circular(Dimensions.width(42.0)),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(
                    title: "Bitter Orange Marinade",
                  ),
                  SizedBox(
                    height: Dimensions.height(20.0),
                  ),
                  BigText(text: "Introduce"),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableText(
                        content:
                            "Chicken marinates in spiced yogurt in a large pot, then layered with fried onion (cheeky easy sub below), fresh coriander/cilantro, then par boiled. Chicken marinates in spiced yogurt in a large pot, then layered with fried onion (cheeky easy sub below), fresh coriander/cilantro, then par boiled.",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.height(140.0),
        padding: EdgeInsets.only(
          top: Dimensions.height(32.0),
          left: Dimensions.width(36.0),
          right: Dimensions.width(36.0),
          bottom: Dimensions.height(32.0),
        ),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              Dimensions.width(40.0),
            ),
            topRight: Radius.circular(
              Dimensions.width(40.0),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(
                top: Dimensions.height(12.0),
                left: Dimensions.width(20.0),
                right: Dimensions.width(20.0),
                bottom: Dimensions.height(12.0),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  Dimensions.width(32.0),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.remove,
                    color: AppColors.signColor,
                  ),
                  SizedBox(width: Dimensions.width(20.0)),
                  BigText(text: "0"),
                  SizedBox(width: Dimensions.width(20.0)),
                  Icon(
                    Icons.add,
                    color: AppColors.signColor,
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: Dimensions.height(12.0),
                left: Dimensions.width(20.0),
                right: Dimensions.width(20.0),
                bottom: Dimensions.height(12.0),
              ),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(
                  Dimensions.width(20.0),
                ),
              ),
              child: BigText(
                color: Colors.white,
                text: "\$10 | Add to cart",
              ),
            )
          ],
        ),
      ),
    );
  }
}
