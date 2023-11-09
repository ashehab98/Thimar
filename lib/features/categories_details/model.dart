class CategoriesDetailsData {
  late final List<CategoriesDetailsModel> list;

  late final String status;
  late final String message;

  CategoriesDetailsData.fromJson(Map<String, dynamic> json) {
    list = List.from(json['data']).map((e) => CategoriesDetailsModel.fromJson(e)).toList();

    status = json['status'];
    message = json['message'];
  }
}

class CategoriesDetailsModel {
  late final int categoryId;
  late final int id;
  late final String title;
  late final String description;
  late final String code;
  late final double priceBeforeDiscount;
  late final double price;
  late   double discount;
  late final double amount;
  late final int isActive;
  late final bool isFavorite;
  late final Unit unit;
  late final List<dynamic> images;
  late final String mainImage;
  late final String createdAt;

  CategoriesDetailsModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    id = json['id'];
    title = json['title'];
    description = json['description'];
    code = json['code'];
    priceBeforeDiscount = double.tryParse(json['price_before_discount'].toString())??0;
    price = double.tryParse(json['price'].toString())??0;
    discount = json['discount'];
    discount = discount * 100;
    amount = json['amount'];
    isActive = json['is_active'];
    isFavorite = json['is_favorite'];
    unit = Unit.fromJson(json['unit']);
    images = List.castFrom<dynamic, dynamic>(json['images']);
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

