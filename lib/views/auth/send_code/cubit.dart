import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/views/auth/send_code/states.dart';

import '../../../core/logic/dio_helper.dart';
import '../../../core/logic/helper_methods.dart';
import '../login/view.dart';

class SendCodeCubit extends Cubit<SendCodeStates> {
  SendCodeCubit() : super(SendCodeStates());
  bool isObscure = true;

  bool isTimerFineshed = false;
  final formKey = GlobalKey<FormState>();
  final codeController = TextEditingController();


  void verify(String phone) async {
    if (formKey.currentState!.validate()) {
      emit(SendCodeLoadingState());

      final response = await DioHelper().sendData("verify", data: {
        "code": codeController.text,
        "phone": phone,
        "device_token": "test",
        "type": Platform.operatingSystem,
      });
      if (response.isSuccess) {
        // if (widget.isActive ) {
        //    navigateTo(LoginView());
        //} else {
        //navigateTo(NewPasswordView());
        //}
        showmessage(response.message, type: messageType.success);
        navigateTo(const LoginView());
        //  navigateTo(

        //NewPasswordView(), انا اللى عاملها

        // SendCodeView(
        //   isActive: true, phone: phoneController.text,
        // ),

        // );
        emit(SendCodeSuccessState());
      } else {
        showmessage(response.message);
      }
    }
  }
}
