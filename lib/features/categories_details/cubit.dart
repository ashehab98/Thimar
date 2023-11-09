import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/features/categories_details/model.dart';
import 'package:thimar/features/categories_details/states.dart';
import '../../core/logic/dio_helper.dart';

class CategoriesDetailsCubit extends Cubit<CategoriesDetailsStates> {
  CategoriesDetailsCubit() : super(CategoriesDetailsStates());
  Future<void> getData(id) async {
    emit(CategoriesDetailsLoadingState());
    final response = await DioHelper().getData("categories/$id");
    if (response.isSuccess) {
      final model = CategoriesDetailsData.fromJson(response.response!.data);
      emit(CategoriesDetailsSuccessState(list: model.list));
    } else {
      emit(CategoriesDetailsFailedState(msg: response.message));
    }
  }
}
