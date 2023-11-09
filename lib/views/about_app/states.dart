import 'package:thimar/features/cart/model.dart';
import 'package:thimar/views/about_app/model.dart';

class AboutAppStates {}

class AboutAppLoadingState extends AboutAppStates {}

class AboutAppSuccessState extends AboutAppStates {
 final  String data ;
   AboutAppSuccessState({required this.data});
 }

class AboutAppFailedState extends AboutAppStates {
  final String msg;

  AboutAppFailedState({required this.msg});

}
