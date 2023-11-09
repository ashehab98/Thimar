import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/core/logic/dio_helper.dart';
import 'package:thimar/features/cart/model.dart';
import 'package:thimar/views/about_app/model.dart';
import 'package:thimar/views/about_app/states.dart';

class AboutAppCubit extends Cubit<AboutAppStates>{
  AboutAppCubit():super(AboutAppStates());
  Future<void> getData()async {
    emit(AboutAppLoadingState());
    final response = await DioHelper().getData("about");
    if(response.isSuccess){
      final data = AboutAppData.fromJson(response.response!.data);
      emit(AboutAppSuccessState(data: data.data.about));

    }else(AboutAppFailedState(msg: response.message));
  }
}