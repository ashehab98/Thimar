// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unnecessary_import, non_constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/logic/cache_helper.dart';
import 'package:thimar/main.dart';
import 'package:thimar/views/auth/login/cubit.dart';
import 'package:thimar/views/auth/login/model.dart';
import 'package:thimar/views/auth/login/states.dart';
import 'package:thimar/views/auth/send_code/view.dart';

import '../../../core/design/app_button.dart';
import '../../../core/design/app_input.dart';
import '../../../core/logic/dio_helper.dart';
import '../../../core/logic/helper_methods.dart';
import '../../home/pages/main/view.dart';
import '../../home/view.dart';
import '../forget_password/view.dart';
import '../register/view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // try {
  //   final response =
  //       await Dio().post("https://thimar.amr.aait-d.com/api/login", data: {
  //     "phone": phoneController.text,
  //     "password": passwordController.text,
  //     "device_token": "test",
  //     "type": Platform.operatingSystem,
  //     "user_type": "client",
  //   });
  //   showmessage(response.data["message"],type: messageType.success);
  //   isLoading = false;
  // } on DioException catch (ex) {
  //   isLoading = false;
  //   showmessage(ex.response?.data["message"]);

  // }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Builder(
        builder: (context) {
          LoginCubit cubit = BlocProvider.of(context);

          return Container(
            color: Colors.white,
            child: Stack(
              children: <Widget>[
                Image.asset(
                  "assets/images/splash_bg.png",
                  fit: BoxFit.fill,
                  height: double.infinity,



                  width: double.infinity,
                ),
                //custom widget
                Scaffold(
                  backgroundColor: Colors.transparent,
                  body: SafeArea(
                    child: Form(
                      key: cubit.formKey,
                      child: ListView(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                        children: <Widget>[
                          Center(
                            child: Image.asset(
                              "assets/images/logo.png",
                              height: 125,
                              width: 110,
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            height: 21,
                          ),
                          Text(
                            "مرحبا بك مرة أخرى",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "يمكنك تسجيل الدخول الأن",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: Color(0xff707070),
                            ),
                          ),
                          SizedBox(
                            height: 28,
                          ),
                          AppInput(
                            controller: cubit.phoneController,
                            labelText: "رقم الجوال",
                            icon: "assets/icons/phone.png",
                            isPhone: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "رقم الهاتف مطلوب";
                              } else if (value.length < 9) {
                                return "يجب الا يقل رقم الهاتف عن 9 أرقام";
                              }
                              return null;
                            },
                          ),
                          AppInput(
                            controller: cubit.passwordController,
                            labelText: "كلمة المرور",
                            icon: "assets/icons/lock.png",
                            isPhone: false,
                            paddingbuttom: 9,
                            isObscure: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "كلمة المرور مطلوبه";
                              } else if (value.length < 6) {
                                return "كلمة المرور ضعيفة";
                              }
                              return null;
                            },
                          ),
                          Align(
                            alignment: AlignmentDirectional.centerEnd,
                            child: TextButton(
                              onPressed: () {
                                navigateTo(ForgetPaswwordView());
                              },
                              child: Text(
                                "نسيت كلمة المرور ؟",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xffAFAFAF),
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 22.h,
                          ),
                          BlocBuilder(
                            bloc: cubit,
                            builder: (context, state) => AppButton(
                              isLoading: state is LoginLoadingState,
                              onPress: () {
                                cubit.login();
                                setState(() {});
                              },
                              text: "تسجيل الدخول",
                            ),
                          ),
                          SizedBox(
                            height: 48,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "ليس لديك حساب ؟",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  navigateTo(RegisterView());
                                },
                                child: Text(
                                  "تسجيل الأن",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
