import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/core/logic/dio_helper.dart';
import 'package:thimar/features/cities/states.dart';

import 'model.dart';

class GetCitiesCubit extends Cubit<GetCitiesStates> {
  GetCitiesCubit() : super(GetCitiesStates());
  late GetCitiesData model;
  void getData() async {
    emit(GetCitiesLoadingState());
    final response = await DioHelper().getData("cities/1");

    if (response.isSuccess) {
      model = GetCitiesData.fromJson(response.response!.data);

      emit(GetCitiesSuccessState());
    } else {
      emit(GetCitiesFailedState());
    }
  }
}
