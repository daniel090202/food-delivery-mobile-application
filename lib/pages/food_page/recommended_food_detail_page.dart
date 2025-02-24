import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:food_delivery_mobile_application/themes/colors.dart';

import 'package:food_delivery_mobile_application/routes/route_helper.dart';

import 'package:food_delivery_mobile_application/models/product_model.dart';

import 'package:food_delivery_mobile_application/utilities/constants.dart';
import 'package:food_delivery_mobile_application/utilities/dimensions.dart';

import 'package:food_delivery_mobile_application/widgets/app_icon.dart';
import 'package:food_delivery_mobile_application/widgets/big_text.dart';
import 'package:food_delivery_mobile_application/widgets/expandable_text.dart';

import 'package:food_delivery_mobile_application/controllers/cart_controller.dart';
import 'package:food_delivery_mobile_application/controllers/popular_product_controller.dart';
import 'package:food_delivery_mobile_application/controllers/recommended_product_controller.dart';

class RecommendedFoodDetailPage extends StatelessWidget {
  final int pageId;
  final String page;

  const RecommendedFoodDetailPage({
    super.key,
    this.pageId = 1,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        Get.find<RecommendedProductController>().recommendedProducts[pageId];

    Get.find<PopularProductController>()
        .initPopularProduct(product, Get.find<CartController>());

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            automaticallyImplyLeading: false,
            toolbarHeight: Dimensions.height(80.0),
            expandedHeight: Dimensions.height(250.0),
            backgroundColor: AppColors.yellowColor,
            title: Row(
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
                  child: AppIcon(
                    icon: Icons.clear,
                    size: Dimensions.width(64.0),
                    iconSize: Dimensions.width(32.0),
                  ),
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
                          Get.find<PopularProductController>().totalItems >= 1
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
                          Get.find<PopularProductController>().totalItems >= 1
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
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20.0),
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(
                  top: Dimensions.height(10.0),
                  bottom: Dimensions.height(10.0),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.width(60.0)),
                    topRight: Radius.circular(Dimensions.width(60.0)),
                  ),
                ),
                child: Center(
                  child: BigText(
                    text: product.name ?? "",
                    size: Dimensions.height(42.0),
                  ),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                "${Constants.BASE_URL}${Constants.IMAGE_UPLOAD_URI}/${product.img}",
                fit: BoxFit.cover,
                width: double.maxFinite,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: Dimensions.width(20.0),
                      right: Dimensions.width(20.0),
                    ),
                    child: ExpandableText(content: product.description ?? ""),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (popularProductController) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: Dimensions.width(50.0),
                  top: Dimensions.height(10.0),
                  right: Dimensions.width(50.0),
                  bottom: Dimensions.height(10.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        popularProductController.setQuantity(false);
                      },
                      child: AppIcon(
                        icon: Icons.remove,
                        iconColor: Colors.white,
                        iconSize: Dimensions.width(40.0),
                        backgroundColor: AppColors.primaryColor,
                      ),
                    ),
                    BigText(
                      size: Dimensions.height(32.0),
                      color: AppColors.mainBlackColor,
                      text:
                          "\$${product.price ?? 0} X ${popularProductController.itemsInCart}",
                    ),
                    GestureDetector(
                      onTap: () {
                        popularProductController.setQuantity(true);
                      },
                      child: AppIcon(
                        icon: Icons.add,
                        iconColor: Colors.white,
                        iconSize: Dimensions.width(40.0),
                        backgroundColor: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
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
                      child: Icon(
                        Icons.favorite,
                        size: Dimensions.height(32.0),
                        color: AppColors.primaryColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        popularProductController.addItem(product);
                      },
                      child: Container(
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
                          size: Dimensions.height(26.0),
                          text: "\$${product.price ?? 0} | Add to cart",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
