import 'package:thimar/features/cart/model.dart';

class CartStates {}
class CartLoadingState extends CartStates {}
class CartSuccessState extends CartStates {
   CartData list;
  CartSuccessState({required this.list});
}
class CartFailedState extends CartStates {
  final String msg;

  CartFailedState(this.msg);

}