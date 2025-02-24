import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:food_delivery_mobile_application/themes/colors.dart';

import 'package:food_delivery_mobile_application/models/cart_model.dart';
import 'package:food_delivery_mobile_application/models/product_model.dart';

import 'package:food_delivery_mobile_application/controllers/cart_controller.dart';

import 'package:food_delivery_mobile_application/data/repository/popular_product_repository.dart';

class PopularProductController extends GetxController {
  final PopularProductRepository popularProductRepository;

  int _quantity = 0;
  int _itemsInCart = 0;
  bool _isLoaded = false;
  List<dynamic> _popularProducts = [];
  late CartController _cartController;

  bool get isLoaded => _isLoaded;
  int get quantity => _quantity;
  int get itemsInCart => _itemsInCart + _quantity;
  int get totalItems => _cartController.totalItems;
  List<dynamic> get popularProduct => _popularProducts;

  PopularProductController({required this.popularProductRepository});

  Future<void> getPopularProduct() async {
    Response response = await popularProductRepository.getPopularProduct();

    if (response.statusCode == 200) {
      _popularProducts = [];
      _popularProducts.addAll(Product.fromJson(response.body).products);

      _isLoaded = true;

      update();
    }
  }

  List<CartModel> get getItems {
    return _cartController.getItems;
  }

  void initPopularProduct(ProductModel product, CartController cartController) {
    _quantity = 0;
    _itemsInCart = 0;
    _cartController = cartController;

    bool isExisted = _cartController.isExistedInCart(product);

    if (isExisted) {
      _itemsInCart = _cartController.getQuantity(product);
    }
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }

    update();
  }

  int checkQuantity(int quantity) {
    if ((_itemsInCart + quantity) < 0) {
      Get.snackbar(
        "Item count",
        "You can not reduce more!",
        colorText: Colors.white,
        backgroundColor: AppColors.primaryColor,
      );

      if (_itemsInCart > 0) {
        _quantity = -_itemsInCart;

        return _quantity;
      }

      return 0;
    } else if ((_itemsInCart + quantity) > 20) {
      Get.snackbar(
        "Item count",
        "You can not add more!",
        colorText: Colors.white,
        backgroundColor: AppColors.primaryColor,
      );

      return 20;
    }

    return quantity;
  }

  void addItem(ProductModel product) {
    if (_quantity > 0) {
      _cartController.addItem(product, _quantity);

      _quantity = 0;

      _itemsInCart = _cartController.getQuantity(product);

      update();
    }
  }
}
