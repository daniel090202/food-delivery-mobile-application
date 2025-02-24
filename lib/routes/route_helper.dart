import 'package:food_delivery_mobile_application/pages/splash/splash_page.dart';
import 'package:get/get.dart';

import 'package:food_delivery_mobile_application/pages/home_page/home_page.dart';
import 'package:food_delivery_mobile_application/pages/cart_page/cart_page.dart';
import 'package:food_delivery_mobile_application/pages/food_page/popular_food_detail_page.dart';
import 'package:food_delivery_mobile_application/pages/food_page/recommended_food_detail_page.dart';

class RouteHelper {
  static const String _initialPage = "/";
  static const String _splashPage = "/splash-page";
  static const String _cartPage = "/cart-page";
  static const String _popularProductPage = "/popular-product";
  static const String _recommendedProductPage = "/recommended-product";

  static String getCartPage() => _cartPage;
  static String getSplashPage() => _splashPage;
  static String getInitialPage() => _initialPage;

  static String getRecommendedProductPage(int pageId, String page) =>
      "$_recommendedProductPage?pageId=$pageId&page=$page";

  static String getPopularProductPage(int pageId, String page) =>
      "$_popularProductPage?pageId=$pageId&page=$page";

  static List<GetPage> routes = [
    GetPage(
      name: _splashPage,
      page: () => SplashPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _cartPage,
      page: () => CartPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _initialPage,
      page: () => HomePage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _popularProductPage,
      transition: Transition.fadeIn,
      page: () {
        String pageId = Get.parameters["pageId"] ?? "1";
        String page = Get.parameters["page"] ?? _initialPage;

        return PopularFoodDetailPage(pageId: int.parse(pageId), page: page);
      },
    ),
    GetPage(
      name: _recommendedProductPage,
      transition: Transition.fadeIn,
      page: () {
        String pageId = Get.parameters["pageId"] ?? "1";
        String page = Get.parameters["page"] ?? _initialPage;

        return RecommendedFoodDetailPage(pageId: int.parse(pageId), page: page);
      },
    ),
  ];
}
