class CartData {
  CartData({
    required this.data,
    required this.totalPriceBeforeDiscount,
    required this.totalDiscount,
    required this.totalPriceWithVat,
    required this.deliveryCost,
    required this.freeDeliveryPrice,
    required this.vat,
    required this.isVip,
    required this.vipDiscountPercentage,
    required this.minVipPrice,
    required this.vipMessage,
    required this.status,
    required this.message,
  });
  late final List<Data> data;
  late final int totalPriceBeforeDiscount;
  late final int totalDiscount;
  late final int totalPriceWithVat;
  late final int deliveryCost;
  late final int freeDeliveryPrice;
  late final double vat;
  late final int isVip;
  late final int vipDiscountPercentage;
  late final int minVipPrice;
  late final String vipMessage;
  late final String status;
  late final String message;

  CartData.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
    totalPriceBeforeDiscount = json['total_price_before_discount'];
    totalDiscount = json['total_discount'];
    totalPriceWithVat = json['total_price_with_vat'];
    deliveryCost = json['delivery_cost'];
    freeDeliveryPrice = json['free_delivery_price'];
    vat = json['vat'];
    isVip = json['is_vip'];
    vipDiscountPercentage = json['vip_discount_percentage'];
    minVipPrice = json['min_vip_price'];
    vipMessage = json['vip_message'];
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['data'] = data.map((e)=>e.toJson()).toList();
    data['total_price_before_discount'] = totalPriceBeforeDiscount;
    data['total_discount'] = totalDiscount;
    data['total_price_with_vat'] = totalPriceWithVat;
    data['delivery_cost'] = deliveryCost;
    data['free_delivery_price'] = freeDeliveryPrice;
    data['vat'] = vat;
    data['is_vip'] = isVip;
    data['vip_discount_percentage'] = vipDiscountPercentage;
    data['min_vip_price'] = minVipPrice;
    data['vip_message'] = vipMessage;
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class Data {
  Data({
    required this.id,
    required this.title,
    required this.image,
    required this.amount,
    required this.priceBeforeDiscount,
    required this.discount,
    required this.price,
    required this.remainingAmount,
  });
  late final int id;
  late final String title;
  late final String image;
  late final int amount;
  late final int priceBeforeDiscount;
  late final int discount;
  late final int price;
  late final double remainingAmount;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    image = json['image'];
    amount = json['amount'];
    priceBeforeDiscount = json['price_before_discount'];
    discount = json['discount'];
    price = json['price'];
    remainingAmount = json['remaining_amount'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['amount'] = amount;
    data['price_before_discount'] = priceBeforeDiscount;
    data['discount'] = discount;
    data['price'] = price;
    data['remaining_amount'] = remainingAmount;
    return data;
  }
}