import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/core/logic/dio_helper.dart';
import 'package:thimar/features/cart/model.dart';
import 'package:thimar/features/cart/states.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartStates());
  Future<void> getData() async {
    emit(CartLoadingState());
    final response = await DioHelper().getData("client/cart");
    if (response.isSuccess) {
      final list = CartData.fromJson(response.response!.data);
      
      emit(CartSuccessState(list: list));
    } else {
      emit(CartFailedState(response.message));
    }
  }
}
