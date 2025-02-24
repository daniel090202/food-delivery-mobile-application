import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:food_delivery_mobile_application/models/cart_model.dart';
import 'package:food_delivery_mobile_application/utilities/constants.dart';

class CartRepository extends GetxService {
  final SharedPreferences sharedPreferences;

  List<String> cart = [];

  CartRepository({required this.sharedPreferences});

  void addToCart(List<CartModel> addedCart) {
    cart = [];

    for (CartModel item in addedCart) {
      cart.add(jsonEncode(item));
    }

    sharedPreferences.setStringList(Constants.CART, cart);
    print(sharedPreferences.getStringList(Constants.CART));
  }

  List<CartModel> getCart() {
    List<CartModel> storedCart = [];
    List<String> storedCartString = [];

    if (sharedPreferences.containsKey(Constants.CART)) {
      storedCartString = sharedPreferences.getStringList(Constants.CART) ?? [];
    }

    for (String item in storedCartString) {
      storedCart.add(CartModel.fromJson(jsonDecode(item)));
    }

    return storedCart;
  }
}
