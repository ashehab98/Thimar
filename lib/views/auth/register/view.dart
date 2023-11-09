// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/design/app_button.dart';
import 'package:thimar/core/logic/dio_helper.dart';
import 'package:thimar/gen/assets.gen.dart';
import 'package:thimar/features/cities/model.dart';
import 'package:thimar/views/auth/register/cubit.dart';
import 'package:thimar/views/auth/register/states.dart';
import 'package:thimar/views/sheets/cities.dart';

import '../../../core/design/app_input.dart';
import '../../../core/logic/helper_methods.dart';
import '../login/view.dart';
import '../send_code/view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Builder(builder: (context) {
        RegisterCubit cubit = BlocProvider.of(context);
        return Container(
          color: Colors.white,
          child: Stack(
            children: [
              Image.asset(
                Assets.images.splashBg.path,
                fit: BoxFit.fill,
                height: double.infinity,
                width: double.infinity,
              ),
              Scaffold(
                backgroundColor: Colors.transparent,
                body: SafeArea(
                  child: Form(
                    key: cubit.formkey,
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
                          "يمكنك تسجيل حساب جديد الأن",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Color(0xff707070),
                          ),
                        ),
                        AppInput(
                          controller: cubit.FullNameContoller,
                          paddingtop: 28,
                          labelText: "اسم المستخدم",
                          icon: "assets/icons/person.png",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "اسم المستخدم مطلوب";
                            } else if (value.length < 7) {
                              return "يجب الا يقل اسم المستخدم عن 7 أحرف";
                            }
                            return null;
                          },
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
                        StatefulBuilder(
                          builder: (context, setState) => GestureDetector(
                            onTap: () async {
                              var result = await showModalBottomSheet(
                                  context: context,
                                  builder: (context) => CitiesSheet());
                              if (result != null) {
                                cubit.selectedCity = result;
                                setState(() {});
                                print(
                                    "the result is $cubit.selectedCity!.name");
                              }
                            },
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: AbsorbPointer(
                                    absorbing: true,
                                    child: AppInput(
                                      validator: (value) {
                                        if (cubit.selectedCity == null) {
                                          return "يجب اختيار مدينتك";
                                        }
                                        return null;
                                      },
                                      labelText:
                                          cubit.selectedCity?.name ?? "المدينة",
                                      icon: "assets/icons/city_flag.png",
                                      paddingbuttom: 0,
                                    ),
                                  ),
                                ),
                                if (cubit.selectedCity != null)
                                  IconButton(
                                    onPressed: () {
                                      cubit.selectedCity = null;
                                      setState(() {});
                                    },
                                    icon: Icon(
                                      Icons.clear,
                                      color: Colors.red,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        AppInput(
                          controller: cubit.passwordController,
                          labelText: "كلمة المرور",
                          icon: "assets/icons/lock.png",
                          isObscure: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "كلمة المرور مطلوبه";
                            } else if (value.length < 7) {
                              return "كلمة المرور ضعيفة";
                            }
                            return null;
                          },
                        ),
                        AppInput(
                          controller: cubit.confirmPasswordController,
                          labelText: "كلمة المرور",
                          icon: "assets/icons/lock.png",
                          isObscure: true,
                          paddingbuttom: 24,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "تأكيد  كلمة المرور ضعيفة";
                            } else if (cubit.confirmPasswordController.text !=
                                cubit.passwordController.text) {
                              return "يجب تطابق كلمتي المرور";
                            }
                            return null;
                          },
                        ),
                        BlocBuilder(
                          bloc: cubit,
                          builder: (context, state) => state is RegisterLoadingState
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : AppButton(
                                  text: "تسجيل",
                                  onPress: () {
                                    cubit.register();
                                  },
                                ),
                        ),
                        SizedBox(
                          height: 45.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "لديك حساب بالفعل ؟",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                navigateTo(LoginView());
                              },
                              child: Text(
                                "تسجيل الدخول",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
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
      }),
    );
  }
}
