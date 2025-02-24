import 'package:flutter/material.dart';

import 'package:food_delivery_mobile_application/themes/colors.dart';

import 'package:food_delivery_mobile_application/widgets/big_text.dart';
import 'package:food_delivery_mobile_application/widgets/small_text.dart';

import 'package:food_delivery_mobile_application/utilities/dimensions.dart';

import 'package:food_delivery_mobile_application/pages/food_page/food_page.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: Dimensions.width(20.0),
                right: Dimensions.width(20.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                        text: "Vietnam",
                        size: Dimensions.height(32.0),
                        color: AppColors.primaryColor,
                      ),
                      Row(
                        children: [
                          SmallText(
                            color: Colors.black54,
                            text: "Ho Chi Minh city",
                            size: Dimensions.height(24.0),
                          ),
                          SizedBox(width: Dimensions.width(4.0)),
                          Icon(
                            Icons.arrow_drop_down_rounded,
                            size: Dimensions.width(32.0),
                            color: AppColors.textColor,
                          )
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: Dimensions.width(80.0),
                      height: Dimensions.width(80.0),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                      ),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: Dimensions.height(20.0)),
            Expanded(
              child: SingleChildScrollView(
                child: FoodPage(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
