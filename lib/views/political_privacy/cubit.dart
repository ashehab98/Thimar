import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/core/logic/dio_helper.dart';
import 'package:thimar/views/political_privacy/model.dart';
import 'package:thimar/views/political_privacy/states.dart';

class PolicyCubit extends Cubit<PolicyStates> {
  PolicyCubit() : super(PolicyStates());
  Future<void> getData() async {
    emit(PolicyLoadingState());
    final response = await DioHelper().getData("policy");
    if (response.isSuccess) {
      final data = PolicyData.fromJson(response.response!.data);
      emit(PolicySuccessState(data: data.data.policy));
    }
  }
}
