import 'package:thimar/features/rates/model.dart';

class RatesStates {}

class RatesLoadingState extends RatesStates {}

class RatesSuccessState extends RatesStates {
  RatesData list;
  RatesSuccessState({required this.list});
}

class RatesFailedState extends RatesStates {
  final String msg;

  RatesFailedState({required this.msg});
}
