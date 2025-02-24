import 'package:get/get.dart';

import 'package:food_delivery_mobile_application/data/api/api_client.dart';

import 'package:food_delivery_mobile_application/utilities/constants.dart';

class RecommendedProductRepository extends GetxService {
  final ApiClient apiClient;

  RecommendedProductRepository({required this.apiClient});

  Future<Response> getRecommendedProduct() async {
    return await apiClient.getData(Constants.RECOMMENDED_PRODUCT_URI);
  }
}
