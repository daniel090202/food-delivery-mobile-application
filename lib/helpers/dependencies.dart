import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:food_delivery_mobile_application/utilities/constants.dart';

import 'package:food_delivery_mobile_application/controllers/cart_controller.dart';
import 'package:food_delivery_mobile_application/controllers/popular_product_controller.dart';
import 'package:food_delivery_mobile_application/controllers/recommended_product_controller.dart';

import 'package:food_delivery_mobile_application/data/api/api_client.dart';
import 'package:food_delivery_mobile_application/data/repository/cart_repository.dart';
import 'package:food_delivery_mobile_application/data/repository/popular_product_repository.dart';
import 'package:food_delivery_mobile_application/data/repository/recommended_product_repository.dart';

Future<void> init() async {
  // Shared references to share data in entire application:
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);

  // API Client
  Get.lazyPut(() => ApiClient(appBaseUrl: Constants.BASE_URL));

  // Repositories
  Get.lazyPut(() => CartRepository(sharedPreferences: Get.find()));
  Get.lazyPut(() => PopularProductRepository(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepository(apiClient: Get.find()));

  // Controllers
  Get.lazyPut(() => CartController(cartRepository: Get.find()));
  Get.lazyPut(
    () => PopularProductController(popularProductRepository: Get.find()),
  );
  Get.lazyPut(
    () =>
        RecommendedProductController(recommendedProductRepository: Get.find()),
  );
}
