class AboutAppData {

  late final AboutAppModel data;
  late final String status;
  late final String message;

  AboutAppData.fromJson(Map<String, dynamic> json){
    data = AboutAppModel.fromJson(json['data']);
    status = json['status'];
    message = json['message'];
  }


}

class AboutAppModel {

  late final String about;

  AboutAppModel.fromJson(Map<String, dynamic> json){
    about = json['about'];
  }


}