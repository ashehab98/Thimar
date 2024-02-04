import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/views/auth/login/states.dart';

import '../../../core/logic/cache_helper.dart';
import '../../../core/logic/dio_helper.dart';
import '../../../core/logic/helper_methods.dart';
import '../../home/view.dart';
 import 'model.dart';

class LoginCubit extends Cubit<LoginStates> {
  final phoneController = TextEditingController(text: '550011223344');
  final passwordController = TextEditingController(text: "123456789");
  final formKey = GlobalKey<FormState>();
  LoginCubit() : super(LoginStates());
  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoadingState());
      final response = await DioHelper().sendData("login", data: {
        "phone": phoneController.text,
        "password": passwordController.text,
        "device_token": "test",
        "type": Platform.operatingSystem,
        "user_type": "client",
      });
      if (response.isSuccess) {
        final model = UserData.fromJson(response.response!.data);
        await CacheHelper.saveUserData(model.model);
        navigateTo(const HomeView());
        emit(LoginSuccessState());
      } else {
        showmessage(response.message);
        emit(LoginFailedState());
      }
    }
  }
}
