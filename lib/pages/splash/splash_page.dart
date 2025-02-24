import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:food_delivery_mobile_application/routes/route_helper.dart';
import 'package:food_delivery_mobile_application/utilities/dimensions.dart';

import 'package:food_delivery_mobile_application/controllers/popular_product_controller.dart';
import 'package:food_delivery_mobile_application/controllers/recommended_product_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation<double> _animation;

  Future<void> _loadResource() async {
    await Get.find<PopularProductController>().getPopularProduct();
    await Get.find<RecommendedProductController>().getRecommendedProduct();
  }

  @override
  void initState() {
    super.initState();

    _loadResource();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..forward();

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    );

    Timer(
      Duration(seconds: 3),
      () => Get.offNamed(
        RouteHelper.getInitialPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: _animation,
            child: Center(
              child: Image.asset("assets/images/logo_part_1.png"),
            ),
          ),
          Center(
            child: Image.asset(
              "assets/images/logo_part_2.png",
              width: Dimensions.width(520.0),
            ),
          )
        ],
      ),
    );
  }
}
