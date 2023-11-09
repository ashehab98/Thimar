class RatesData {
  late final List<RatesModel> data;
  late final String status;
  late final String message;

  RatesData.fromJson(Map<String, dynamic> json) {
    data = List.from(json['data'] ?? {})
        .map((e) => RatesModel.fromJson(e))
        .toList();
    status = json['status'];
    message = json['message'];
  }
}

class RatesModel {
  late final double value;
  late final String comment;
  late final String clientName;
  late final String clientImage;

  RatesModel.fromJson(Map<String, dynamic> json) {
    value = double.parse(json['value'].toString()) ?? 0;
    comment = json['comment'] ?? "";
    clientName = json['client_name'] ?? "";
    clientImage = json['client_image'] ?? "";
  }
}
