import 'package:food_delivery_mobile_application/utilities/constants.dart';
import 'package:get/get.dart';

import 'package:food_delivery_mobile_application/data/api/api_client.dart';

class PopularProductRepository extends GetxService {
  final ApiClient apiClient;

  PopularProductRepository({required this.apiClient});

  Future<Response> getPopularProduct() async {
    return await apiClient.getData(Constants.POPULAR_PRODUCT_URI);
  }
}
