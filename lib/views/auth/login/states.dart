import 'package:thimar/core/logic/helper_methods.dart';
import 'package:thimar/views/home/view.dart';

class LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  LoginSuccessState(){
    navigateTo(const HomeView());
  }

}

class LoginFailedState extends LoginStates {}
