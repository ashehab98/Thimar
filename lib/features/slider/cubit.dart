import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/features/slider/model.dart';
import 'package:thimar/features/slider/states.dart';

import '../../core/logic/dio_helper.dart';

class SliderCubit extends Cubit<SliderStates>{
  SliderCubit():super (SliderStates());

  Future<void> getData() async {
    emit(GetSliderLoadingState());
    final response = await DioHelper().getData("sliders");
    print(response.response?.data);
    if(response.isSuccess){
      final model = SliderData.fromJson(response.response!.data);
        emit(GetSliderSuccessState(list: model.list));
    }else{
      emit(GetSliderFailedState(msg: response.message));
    }

  }
}