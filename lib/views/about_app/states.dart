
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
