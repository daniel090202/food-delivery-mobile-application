import 'package:food_delivery_mobile_application/routes/route_helper.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

import 'package:food_delivery_mobile_application/themes/colors.dart';
import 'package:food_delivery_mobile_application/widgets/big_text.dart';
import 'package:food_delivery_mobile_application/widgets/small_text.dart';
import 'package:food_delivery_mobile_application/widgets/text_with_icon.dart';

import 'package:food_delivery_mobile_application/models/product_model.dart';

import 'package:food_delivery_mobile_application/utilities/constants.dart';
import 'package:food_delivery_mobile_application/utilities/dimensions.dart';

import 'package:food_delivery_mobile_application/pages/food_page/popular_food_detail_page.dart';

import 'package:food_delivery_mobile_application/controllers/popular_product_controller.dart';
import 'package:food_delivery_mobile_application/controllers/recommended_product_controller.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  PageController pageController = PageController(viewportFraction: 0.85);

  double _currentPageValue = 0.0;

  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();

    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<PopularProductController>(
          builder: (popularProductController) {
            return popularProductController.isLoaded
                ? Column(
                  children: [
                    SizedBox(
                      height: Dimensions.pageView,
                      child: PageView.builder(
                        itemCount:
                            popularProductController.popularProduct.length,
                        controller: pageController,
                        itemBuilder: (context, position) {
                          return _buildPageItem(
                            position,
                            popularProductController.popularProduct[position],
                          );
                        },
                      ),
                    ),
                    DotsIndicator(
                      dotsCount:
                          popularProductController.popularProduct.isNotEmpty
                              ? popularProductController.popularProduct.length
                              : 1,
                      position: _currentPageValue.floor() * 1.0,
                      decorator: DotsDecorator(
                        size: Size.square(9.0),
                        activeSize: Size(18.0, 9.0),
                        activeColor: AppColors.primaryColor,
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ],
                )
                : CircularProgressIndicator(color: AppColors.primaryColor);
          },
        ),
        SizedBox(height: Dimensions.height(10.0)),
        Container(
          margin: EdgeInsets.only(left: 20.0, right: 20.0),
          child: Row(
            children: [
              BigText(text: "Popular", size: Dimensions.height(32.0)),
              SizedBox(width: 20.0),
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: BigText(
                  text: ".",
                  size: Dimensions.height(32.0),
                  color: Colors.black26,
                ),
              ),
              SizedBox(width: 20.0),
              SmallText(text: "Food pairing", size: Dimensions.height(24.0)),
            ],
          ),
        ),
        GetBuilder<RecommendedProductController>(
          builder: (recommendedProductController) {
            return recommendedProductController.isLoaded
                ? SizedBox(
                  height: Dimensions.height(900.0),
                  child: ListView.builder(
                    itemCount:
                        recommendedProductController.recommendedProducts.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(
                            RouteHelper.getRecommendedProductPage(
                              index,
                              RouteHelper.getInitialPage(),
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                            left: 20.0,
                            right: 20.0,
                            bottom: 32.0,
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: Dimensions.width(220.0),
                                height: Dimensions.width(220.0),
                                decoration: BoxDecoration(
                                  color: Colors.white38,
                                  borderRadius: BorderRadius.circular(20.0),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      "${Constants.BASE_URL}${Constants.IMAGE_UPLOAD_URI}/${recommendedProductController.recommendedProducts[index].img ?? ""}",
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: Dimensions.height(120.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(
                                        Dimensions.width(20.0),
                                      ),
                                      bottomRight: Radius.circular(
                                        Dimensions.width(20.0),
                                      ),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: Dimensions.width(10.0),
                                      right: Dimensions.width(10.0),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        BigText(
                                          size: Dimensions.height(28.0),
                                          text:
                                              recommendedProductController
                                                  .recommendedProducts[index]
                                                  .name ??
                                              "",
                                        ),
                                        SizedBox(
                                          height: Dimensions.height(6.0),
                                        ),
                                        SmallText(
                                          size: Dimensions.height(18.0),
                                          text: "With Chinese characteristics",
                                        ),
                                        SizedBox(
                                          height: Dimensions.height(6.0),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
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
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
                : CircularProgressIndicator(color: AppColors.primaryColor);
          },
        ),
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel productModel) {
    Matrix4 matrix4 = Matrix4.identity();

    if (index == _currentPageValue.floor()) {
      double currentScale =
          1 - (_currentPageValue - index) * (1 - _scaleFactor);

      double currentTransform = _height * (1 - currentScale) / 2;

      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTransform, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      double currentScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);

      double currentTransform = _height * (1 - currentScale) / 2;

      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTransform, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      double currentScale =
          1 - (_currentPageValue - index) * (1 - _scaleFactor);

      double currentTransform = _height * (1 - currentScale) / 2;

      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTransform, 0);
    } else {
      double currentScale = 0.8;

      double currentTransform = _height * (1 - currentScale) / 2;

      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTransform, 0);
    }

    return Transform(
      transform: matrix4,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(
                RouteHelper.getPopularProductPage(
                  index,
                  RouteHelper.getInitialPage(),
                ),
              );
            },
            child: Container(
              height: _height,
              margin: EdgeInsets.only(left: 12.0, right: 12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "${Constants.BASE_URL}${Constants.IMAGE_UPLOAD_URI}/${productModel.img ?? ""}",
                  ),
                ),
                color: index.isEven ? Color(0xFF69C5DF) : Color(0xFF9294CC),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(left: 32.0, right: 32.0, bottom: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                    color: AppColors.shadowColor,
                  ),
                  BoxShadow(offset: Offset(-5, 0), color: Colors.white),
                  BoxShadow(offset: Offset(5, 0), color: Colors.white),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 12.0,
                  left: 16.0,
                  right: 16.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      text: productModel.name ?? "",
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
                              size: Dimensions.width(32.0),
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                        SizedBox(width: Dimensions.width(12.0)),
                        SmallText(
                          text: "4.5",
                          size: Dimensions.height(20.0),
                          color: AppColors.disabledColor,
                        ),
                        SizedBox(width: Dimensions.width(12.0)),
                        SmallText(
                          text: "1287 comments",
                          size: Dimensions.height(20.0),
                          color: AppColors.disabledColor,
                        ),
                      ],
                    ),
                    SizedBox(height: Dimensions.height(12.0)),
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
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
