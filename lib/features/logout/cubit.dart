import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/core/logic/cache_helper.dart';
import 'package:thimar/core/logic/dio_helper.dart';
import 'package:thimar/core/logic/helper_methods.dart';
import 'package:thimar/features/logout/model.dart';
import 'package:thimar/features/logout/states.dart';
import 'package:thimar/views/auth/splash/view.dart';

class LogOutCubit extends Cubit<LogOutStates> {
  LogOutCubit() : super(LogOutStates());
  Future<void> logOut() async {
    emit(LogOutLoadingState());
    final response = await DioHelper().sendData("logout", data: {
      "device_token": CacheHelper.getToken(),
      "type": Platform.operatingSystem,
    });
    if (response.isSuccess) {
      final model = LogOutData.fromJson(response.response!.data);

      emit(LogOutSuccessState());
      navigateTo(const SplashView());
      CacheHelper.clear();
    } else {
      showmessage(response.message);
      emit(LogOutFailedState());
    }
  }
}
