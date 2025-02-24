import 'package:food_delivery_mobile_application/models/product_model.dart';

class CartModel {
  int? id;
  int? price;
  int? quantity;

  String? img;
  String? name;
  String? time;

  bool? isExist;

  ProductModel? product;

  CartModel({
    this.id,
    this.img,
    this.name,
    this.time,
    this.price,
    this.isExist,
    this.product,
    this.quantity,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    img = json['img'];
    name = json['name'];
    time = json['time'];
    price = json['price'];
    isExist = json['isExist'];
    quantity = json['quantity'];
    product = ProductModel.fromJson(json["product"]);
  }
}
