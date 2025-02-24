import 'package:food_delivery_mobile_application/controllers/popular_product_controller.dart';
import 'package:food_delivery_mobile_application/controllers/recommended_product_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:food_delivery_mobile_application/routes/route_helper.dart';

import 'package:food_delivery_mobile_application/helpers/dependencies.dart'
    as dependencies;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dependencies.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PopularProductController>(builder: (_) {
      return GetBuilder<RecommendedProductController>(builder: (_) {
        return GetMaterialApp(
          title: 'Food Delivery Application',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            primaryColor: Colors.blue,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple,
            ),
          ),
          getPages: RouteHelper.routes,
          initialRoute: RouteHelper.getSplashPage(),
        );
      });
    });
  }
}
