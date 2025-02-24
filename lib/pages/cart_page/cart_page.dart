import 'package:food_delivery_mobile_application/controllers/popular_product_controller.dart';
import 'package:food_delivery_mobile_application/controllers/recommended_product_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:food_delivery_mobile_application/themes/colors.dart';

import 'package:food_delivery_mobile_application/models/cart_model.dart';

import 'package:food_delivery_mobile_application/routes/route_helper.dart';

import 'package:food_delivery_mobile_application/utilities/constants.dart';

import 'package:food_delivery_mobile_application/utilities/dimensions.dart';

import 'package:food_delivery_mobile_application/widgets/app_icon.dart';
import 'package:food_delivery_mobile_application/widgets/big_text.dart';
import 'package:food_delivery_mobile_application/widgets/small_text.dart';

import 'package:food_delivery_mobile_application/controllers/cart_controller.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: Dimensions.height(60.0),
            left: Dimensions.width(20.0),
            right: Dimensions.width(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getInitialPage());
                  },
                  child: AppIcon(
                    iconColor: Colors.white,
                    icon: Icons.arrow_back_ios,
                    size: Dimensions.width(74.0),
                    iconSize: Dimensions.width(42.0),
                    backgroundColor: AppColors.primaryColor,
                  ),
                ),
                Row(
                  children: [
                    AppIcon(
                      iconColor: Colors.white,
                      icon: Icons.home_outlined,
                      size: Dimensions.width(74.0),
                      iconSize: Dimensions.width(42.0),
                      backgroundColor: AppColors.primaryColor,
                    ),
                    SizedBox(width: Dimensions.width(10.0)),
                    AppIcon(
                      iconColor: Colors.white,
                      icon: Icons.shopping_cart,
                      size: Dimensions.width(74.0),
                      iconSize: Dimensions.width(42.0),
                      backgroundColor: AppColors.primaryColor,
                    )
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: Dimensions.height(0),
            left: Dimensions.width(20.0),
            right: Dimensions.width(20.0),
            top: Dimensions.height(120.0),
            child: Container(
              color: Colors.white,
              child: GetBuilder<CartController>(
                builder: (cartController) {
                  List<CartModel> cart = cartController.getItems;

                  return MediaQuery.removePadding(
                    removeTop: true,
                    context: context,
                    child: ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (_, index) {
                        return Container(
                          width: double.maxFinite,
                          margin: EdgeInsets.only(
                            bottom: Dimensions.height(28.0),
                          ),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  int popularIndex =
                                      Get.find<PopularProductController>()
                                          .popularProduct
                                          .indexOf(cart[index].product);

                                  if (popularIndex >= 0) {
                                    Get.toNamed(
                                      RouteHelper.getPopularProductPage(
                                        popularIndex,
                                        RouteHelper.getCartPage(),
                                      ),
                                    );
                                  } else {
                                    int recommendedIndex =
                                        Get.find<RecommendedProductController>()
                                            .recommendedProducts
                                            .indexOf(cart[index].product);

                                    Get.toNamed(
                                      RouteHelper.getRecommendedProductPage(
                                        recommendedIndex,
                                        RouteHelper.getCartPage(),
                                      ),
                                    );
                                  }
                                },
                                child: Container(
                                  width: Dimensions.width(200.0),
                                  height: Dimensions.width(200.0),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          "${Constants.BASE_URL}${Constants.IMAGE_UPLOAD_URI}/${cartController.getItems[index].img}"),
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      Dimensions.width(40.0),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: Dimensions.width(24.0)),
                              Expanded(
                                child: SizedBox(
                                  height: Dimensions.height(120.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      BigText(
                                        color: Colors.black54,
                                        text: cartController
                                                .getItems[index].name ??
                                            "",
                                        size: Dimensions.height(24.0),
                                      ),
                                      SmallText(
                                        text: "Spicy",
                                        size: Dimensions.height(18.0),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          BigText(
                                            text:
                                                "\$${cartController.getItems[index].price ?? 0}",
                                            color: Colors.redAccent,
                                            size: Dimensions.height(26.0),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                              top: Dimensions.height(12.0),
                                              left: Dimensions.width(20.0),
                                              right: Dimensions.width(20.0),
                                              bottom: Dimensions.height(12.0),
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                Dimensions.width(32.0),
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    cartController.addItem(
                                                      cart[index].product!,
                                                      -1,
                                                    );
                                                  },
                                                  child: Icon(
                                                    Icons.remove,
                                                    color: AppColors.signColor,
                                                    size:
                                                        Dimensions.height(20.0),
                                                  ),
                                                ),
                                                SizedBox(
                                                    width:
                                                        Dimensions.width(20.0)),
                                                BigText(
                                                  text: cart[index]
                                                      .quantity
                                                      .toString(),
                                                  color: Colors.black54,
                                                  size: Dimensions.height(26.0),
                                                ),
                                                SizedBox(
                                                    width:
                                                        Dimensions.width(20.0)),
                                                GestureDetector(
                                                  onTap: () {
                                                    cartController.addItem(
                                                      cart[index].product!,
                                                      1,
                                                    );
                                                  },
                                                  child: Icon(
                                                    Icons.add,
                                                    color: AppColors.signColor,
                                                    size:
                                                        Dimensions.height(20.0),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (cartController) {
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
                  padding: EdgeInsets.symmetric(
                    vertical: Dimensions.height(12.0),
                    horizontal: Dimensions.height(32.0),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      Dimensions.width(32.0),
                    ),
                  ),
                  child: BigText(
                    text: "\$ ${cartController.totalAmount.toString()}",
                    color: Colors.black54,
                    size: Dimensions.height(26.0),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: Dimensions.height(12.0),
                    left: Dimensions.width(24.0),
                    right: Dimensions.width(24.0),
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
                      // popularProductController.addItem(product);
                    },
                    child: BigText(
                      color: Colors.white,
                      size: Dimensions.height(26.0),
                      text: "Check out",
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
