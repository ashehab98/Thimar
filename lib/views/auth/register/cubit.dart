import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/views/auth/register/states.dart';

import '../../../core/logic/dio_helper.dart';
import '../../../core/logic/helper_methods.dart';
import '../../../features/cities/model.dart';
import '../send_code/view.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterStates());

  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final FullNameContoller = TextEditingController();
  CityModel? selectedCity;
  final formkey = GlobalKey<FormState>();
  void register() async {
    if (formkey.currentState!.validate()) {
      emit(RegisterLoadingState());

      final response = await DioHelper().sendData("client_register", data: {
        "fullname": FullNameContoller.text,
        "password": passwordController.text,
        "phone": phoneController.text,
        // "gender": "",
        "password_confirmation": confirmPasswordController.text,
        // "lat": "250.0515",
        // "lng": "290.45",
        "city_id": selectedCity!.id,
        "country_id": 1,
      });
      if (response.isSuccess) {
        showmessage(response.message, type: messageType.success);
        navigateTo(SendCodeView(
          isActive: true,
          phone: phoneController.text,
        ));
        emit(RegisterSuccessState());
      } else {
        showmessage(response.message);
        emit(RegisterFailedState());
      }
    }
  }
}
