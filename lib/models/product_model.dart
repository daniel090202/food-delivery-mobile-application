class Product {
  int? _typeId;
  int? _offset;
  int? _totalSize;

  late List<ProductModel> _products;

  List<ProductModel> get products => _products;

  Product({
    required typeId,
    required offset,
    required products,
    required totalSize,
  }) {
    _typeId = typeId;
    _offset = offset;
    _products = products;
    _totalSize = totalSize;
  }

  Product.fromJson(Map<String, dynamic> json) {
    _offset = json['offset'];
    _typeId = json['type_id'];
    _totalSize = json['total_size'];

    if (json['products'] != null) {
      _products = <ProductModel>[];

      json['products'].forEach((product) {
        _products.add(ProductModel.fromJson(product));
      });
    }
  }
}

class ProductModel {
  int? id;
  int? price;
  int? stars;
  int? typeId;

  String? img;
  String? name;
  String? location;
  String? createdAt;
  String? updatedAt;
  String? description;

  ProductModel({
    this.id,
    this.img,
    this.name,
    this.price,
    this.stars,
    this.typeId,
    this.location,
    this.createdAt,
    this.updatedAt,
    this.description,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    img = json['img'];
    name = json['name'];
    price = json['price'];
    stars = json['stars'];
    typeId = json['type_id'];
    location = json['location'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "img": img,
      "name": name,
      "price": price,
      "typeId": typeId,
      "location": location,
      "updatedAt": updatedAt,
      "createdAt": createdAt,
    };
  }
}
