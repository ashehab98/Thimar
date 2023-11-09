part of'cubit.dart';
class ProductsData {
  late final List<ProductsModel> list;
  late final int userCartCount;
  late final double maxPrice;
  late final double minPrice;

  ProductsData.fromJson(Map<String, dynamic> json) {
    list = List.from(json['data'] ?? [])
        .map((e) => ProductsModel.fromJson(e))
        .toList();
    userCartCount = json['user_cart_count'];
    maxPrice =double.tryParse(json['max_price'].toString()) ?? 0;
    minPrice = double.tryParse(json['min_price'].toString()) ?? 0;
  }
}

class ProductsModel {
  late final int categoryId;
  late final int id;
  late final String title;
  late final String description;
  late final String code;
  late final double priceBeforeDiscount;
  late final double price;
  late double discount;
  late final double amount;
  late final int isActive;
  late final bool isFavorite;
  late final Unit unit;
  late final List<Images> images;
  late final String mainImage;
  late final String createdAt;

  ProductsModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    id = json['id'];
    title = json['title'];
    description = json['description'];
    code = json['code'];
    priceBeforeDiscount =
        double.tryParse(json['price_before_discount'].toString()) ?? 0;

    price = double.tryParse(json['price'].toString()) ?? 0;
    discount = json['discount'];
    discount = discount * 100;

    amount = double.tryParse(json['amount'].toString()) ?? 0;
    isActive = json['is_active'];
    isFavorite = json['is_favorite'];
    unit = Unit.fromJson(json['unit']);
    images = List.from(json['images']).map((e) => Images.fromJson(e)).toList();
    mainImage = json['main_image'];
    createdAt = json['created_at'];
  }
}

class Unit {
  late final int id;
  late final String name;
  late final String type;
  late final String createdAt;
  late final String updatedAt;

  Unit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

class Images {
  late final String name;
  late final String url;

  Images.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
}
