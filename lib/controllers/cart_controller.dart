import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:food_delivery_mobile_application/themes/colors.dart';

import 'package:food_delivery_mobile_application/models/cart_model.dart';
import 'package:food_delivery_mobile_application/models/product_model.dart';

import 'package:food_delivery_mobile_application/data/repository/cart_repository.dart';

class CartController extends GetxController {
  final CartRepository cartRepository;

  final Map<int, CartModel> _items = {};

  Map<int, CartModel> get items => _items;

  CartController({required this.cartRepository});

  int get totalItems {
    int totalQuantity = 0;

    _items.forEach(
      (key, value) {
        totalQuantity += (value.quantity ?? 0);
      },
    );

    return totalQuantity;
  }

  int get totalAmount {
    int total = 0;

    _items.forEach((key, value) {
      total = (value.quantity ?? 0) * (value.price ?? 0);
    });

    return total;
  }

  List<CartModel> get getItems {
    return _items.entries.map((e) {
      return e.value;
    }).toList();
  }

  void addItem(ProductModel product, int quantity) {
    int totalQuantity = 0;

    if (_items.containsKey(product.id)) {
      _items.update(
        product.id ?? 0,
        (value) {
          totalQuantity = (value.quantity ?? 0) + quantity;

          return CartModel(
            id: value.id,
            img: value.img,
            name: value.name,
            price: value.price,
            isExist: true,
            product: product,
            time: DateTime.now().toString(),
            quantity: (value.quantity ?? 0) + quantity,
          );
        },
      );

      if (totalQuantity <= 0) {
        _items.remove(product.id);
      }
    } else {
      if (quantity > 0) {
        _items.putIfAbsent(
          product.id ?? 0,
          () {
            return CartModel(
              id: product.id,
              img: product.img,
              name: product.name,
              price: product.price,
              isExist: true,
              product: product,
              quantity: quantity,
              time: DateTime.now().toString(),
            );
          },
        );
      } else {
        Get.snackbar(
          "Item count",
          "You should at least add an item in the cart!",
          colorText: Colors.white,
          backgroundColor: AppColors.primaryColor,
        );
      }
    }

    update();
  }

  bool isExistedInCart(ProductModel product) {
    if (_items.containsKey(product.id)) {
      return true;
    }

    return false;
  }

  int getQuantity(ProductModel product) {
    int quantity = 0;

    if (_items.containsKey(product.id)) {
      _items.forEach((key, value) {
        if (key == product.id) {
          quantity = value.quantity!;
        }
      });
    }

    return quantity;
  }
}
