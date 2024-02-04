class AddToFavData {

  late final String status;
  late final String message;
  late final void data;

  AddToFavData.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = null;
  }


}