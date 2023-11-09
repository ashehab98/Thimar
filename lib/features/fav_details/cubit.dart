

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/features/fav_details/model.dart';
import 'package:thimar/features/fav_details/states.dart';

import '../../core/logic/dio_helper.dart';

class FavDetailsCubit extends Cubit<FavDetailsStates> {
  FavDetailsCubit() : super(FavDetailsStates());
  Future<void> getData() async {
    emit(FavDetailsLoadingState());
    final response = await DioHelper().getData("client/products/favorites");
    if (response.isSuccess) {
      final model = FavDetailsData.fromJson(response.response!.data);
      emit(FavDetailsSuccessState(list:model.data));
    } else {
      emit(FavDetailsFailedState(msg: response.message));
    }
  }
}
