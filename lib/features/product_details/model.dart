part of'cubit.dart';

class ProductData {
  late final String status;
  late final String message;
  late final Data data;

  ProductData.fromJson(Map<String, dynamic> json) {
    status = json['status'] ?? "";
    message = json['message'] ?? "";
    data = Data.fromJson(json['data']);
  }
}

class Data {
  late final int categoryId;
  late final int id;
  late final String title;
  late final String description;
  late final String code;
  late final double priceBeforeDiscount;
  late final double price;
  late  double discount;
  late final double amount;
  late final int isActive;
  late final bool isFavorite;
  late final Unit unit;
  late final List <ImageModel>images;
  late final String mainImage;
  late final String createdAt;

  Data.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'] ?? 0;
    id = json['id'] ?? 0;
    title = json['title'] ?? "";
    description = json['description'] ?? "";
    code = json['code'] ?? "";
    priceBeforeDiscount = double.parse(json['price_before_discount'].toString()) ?? 0;
    price = double.tryParse(json['price'].toString())??0;
     discount = json['discount'] ?? 0.0;
    discount = discount *100;
    amount = double.parse(json['amount'].toString()) ;
    isActive = json['is_active'] ?? 0;
    isFavorite = json['is_favorite'] ?? false;
    unit = Unit.fromJson(json['unit']);
    mainImage = json['main_image'] ?? "";
    images = List.from(json['images']).map((e) => ImageModel.fromJson(e)).toList();
    createdAt = json['created_at'] ?? "";

  }
}

class Unit {
  late final int id;
  late final String name;
  late final String type;
  late final String createdAt;
  late final String updatedAt;

  Unit.fromJson(Map<String, dynamic> json) {
    id = json['id']??0;
    name = json['name']??"";
    type = json['type']??"";
    createdAt = json['created_at']??"";
    updatedAt = json['updated_at']??"";
  }
}
class ImageModel {

  late final String name;
  late final String url;

  ImageModel.fromJson(Map<String, dynamic> json){
    name = json['name'];
    url = json['url'];
  }


}