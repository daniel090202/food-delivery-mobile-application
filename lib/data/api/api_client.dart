import 'package:food_delivery_mobile_application/utilities/constants.dart';
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  final String appBaseUrl;

  late String token;

  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    token = Constants.TOKEN;
    timeout = Duration(seconds: 30);

    _mainHeaders = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

  Future<Response> getData(
    String uri,
  ) async {
    try {
      Response response = await get(uri);

      return response;
    } catch (error) {
      return Response(
        statusCode: 1,
        statusText: error.toString(),
      );
    }
  }
}
