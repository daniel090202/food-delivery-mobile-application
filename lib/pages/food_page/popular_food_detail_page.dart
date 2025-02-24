import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:food_delivery_mobile_application/themes/colors.dart';

import 'package:food_delivery_mobile_application/routes/route_helper.dart';

import 'package:food_delivery_mobile_application/models/product_model.dart';

import 'package:food_delivery_mobile_application/pages/cart_page/cart_page.dart';

import 'package:food_delivery_mobile_application/utilities/constants.dart';
import 'package:food_delivery_mobile_application/utilities/dimensions.dart';

import 'package:food_delivery_mobile_application/widgets/app_icon.dart';
import 'package:food_delivery_mobile_application/widgets/big_text.dart';
import 'package:food_delivery_mobile_application/widgets/app_column.dart';
import 'package:food_delivery_mobile_application/widgets/expandable_text.dart';

import 'package:food_delivery_mobile_application/controllers/cart_controller.dart';
import 'package:food_delivery_mobile_application/controllers/popular_product_controller.dart';

class PopularFoodDetailPage extends StatelessWidget {
  final int pageId;
  final String page;

  const PopularFoodDetailPage({
    super.key,
    this.pageId = 1,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        Get.find<PopularProductController>().popularProduct[pageId];

    Get.find<PopularProductController>()
        .initPopularProduct(product, Get.find<CartController>());

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
                  image: NetworkImage(
                      "${Constants.BASE_URL}${Constants.IMAGE_UPLOAD_URI}/${product.img}"),
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
                GestureDetector(
                  onTap: () {
                    if (page == RouteHelper.getCartPage()) {
                      Get.toNamed(RouteHelper.getCartPage());
                    } else {
                      Get.toNamed(RouteHelper.getInitialPage());
                    }
                  },
                  child: AppIcon(iconSize: 20.0, icon: Icons.arrow_back_ios),
                ),
                GetBuilder<PopularProductController>(
                  builder: (popularProductController) {
                    return GestureDetector(
                      onTap: () {
                        if (popularProductController.totalItems >= 1) {
                          Get.toNamed(RouteHelper.getCartPage());
                        }
                      },
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          AppIcon(
                            iconSize: 20.0,
                            icon: Icons.shopping_bag_outlined,
                          ),
                          popularProductController.totalItems >= 1
                              ? Positioned(
                                  top: -2,
                                  right: -4,
                                  child: AppIcon(
                                    icon: Icons.circle,
                                    size: Dimensions.height(20.0),
                                    iconColor: Colors.transparent,
                                    backgroundColor: AppColors.primaryColor,
                                  ),
                                )
                              : Container(),
                          popularProductController.totalItems >= 1
                              ? Positioned(
                                  top: -2.5,
                                  right: 2,
                                  child: BigText(
                                    color: Colors.white,
                                    size: Dimensions.height(16.0),
                                    text:
                                        "${Get.find<PopularProductController>().totalItems}",
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.height(380.0),
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
                    title: product.name ?? "",
                  ),
                  SizedBox(
                    height: Dimensions.height(20.0),
                  ),
                  BigText(
                    text: "Introduce",
                    size: Dimensions.height(32.0),
                  ),
                  SizedBox(
                    height: Dimensions.height(14.0),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableText(
                        content: product.description ?? "",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (popularProductController) {
          return Container(
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
                      GestureDetector(
                        onTap: () {
                          popularProductController.setQuantity(false);
                        },
                        child: Icon(
                          Icons.remove,
                          color: AppColors.signColor,
                          size: Dimensions.height(20.0),
                        ),
                      ),
                      SizedBox(width: Dimensions.width(20.0)),
                      BigText(
                        text: popularProductController.itemsInCart.toString(),
                        color: Colors.black54,
                        size: Dimensions.height(26.0),
                      ),
                      SizedBox(width: Dimensions.width(20.0)),
                      GestureDetector(
                        onTap: () {
                          popularProductController.setQuantity(true);
                        },
                        child: Icon(
                          Icons.add,
                          color: AppColors.signColor,
                          size: Dimensions.height(20.0),
                        ),
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
                  child: GestureDetector(
                    onTap: () {
                      popularProductController.addItem(product);
                    },
                    child: BigText(
                      color: Colors.white,
                      size: Dimensions.height(26.0),
                      text: "\$${product.price ?? 0} | Add to cart",
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
