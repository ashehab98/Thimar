class AddToFavData {

  late final String status;
  late final String message;
  late final Null data;

  AddToFavData.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = null;
  }


}