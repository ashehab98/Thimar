import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/core/logic/cache_helper.dart';
import 'package:thimar/core/logic/dio_helper.dart';
import 'package:thimar/core/logic/helper_methods.dart';
import 'package:thimar/features/add_to_fav/model.dart';
import 'package:thimar/features/add_to_fav/states.dart';

class AddToFavCubit extends Cubit<AddToFavStates> {
  int count = CacheHelper.getFav();

  AddToFavCubit() : super(AddToFavStates());
  Future<void> AddToFav(id) async {
    emit(AddToFavLoadingState());
    final response =
        await DioHelper().sendData("client/products/$id/add_to_favorite");
    if (response!.isSuccess) {
      final model = AddToFavData.fromJson(response.response!.data);
      emit(AddToFavSuccessState());
    } else {
      showmessage(response.message);
      emit(AddToFavFailedState());
    }
  }
}
