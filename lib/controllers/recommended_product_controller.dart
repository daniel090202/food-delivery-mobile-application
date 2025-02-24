import 'package:get/get.dart';

import 'package:food_delivery_mobile_application/models/product_model.dart';

import 'package:food_delivery_mobile_application/data/repository/recommended_product_repository.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepository recommendedProductRepository;

  bool _isLoaded = false;

  List<dynamic> _recommendedProducts = [];

  bool get isLoaded => _isLoaded;

  List<dynamic> get recommendedProducts => _recommendedProducts;

  RecommendedProductController({required this.recommendedProductRepository});

  Future<void> getRecommendedProduct() async {
    Response response =
        await recommendedProductRepository.getRecommendedProduct();

    if (response.statusCode == 200) {
      _recommendedProducts = [];
      _recommendedProducts.addAll(Product.fromJson(response.body).products);

      _isLoaded = true;

      update();
    } else {}
  }
}
