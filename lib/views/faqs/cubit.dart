import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/core/logic/dio_helper.dart';
import 'package:thimar/views/faqs/model.dart';
import 'package:thimar/views/faqs/states.dart';

class FaqsCubit extends Cubit<FaqsStates> {
  FaqsCubit() : super(FaqsStates());
  Future<void> getData() async {
    emit(FaqsLoadingState());
    final response = await DioHelper().getData("faqs");
    if (response.isSuccess) {
      final model = FaqsData.fromJson(response.response!.data);
      emit(FaqsSuccessState(list: model.data));
    } else {
      emit(FaqsFailedState(msg: response.message));
    }
  }
}
