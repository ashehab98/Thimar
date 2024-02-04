import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/core/logic/dio_helper.dart';
import 'package:thimar/features/rates/model.dart';
import 'package:thimar/features/rates/states.dart';

class RatesCubit extends Cubit<RatesStates> {
  RatesCubit() : super(RatesStates());

  Future<void> getData(int id) async {
    emit(RatesLoadingState());
    final response = await DioHelper().getData("products/$id/rates");
    if (response.isSuccess) {
      final list = RatesData.fromJson(response.response!.data);
      emit(RatesSuccessState(list: list));
      print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&${list.data.first.comment}");

    } else {
      emit(RatesFailedState(msg: response.message));
    }
  }
}
