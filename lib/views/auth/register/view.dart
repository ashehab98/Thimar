// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:thimar/core/design/app_button.dart';
import 'package:thimar/core/logic/dio_helper.dart';
import 'package:thimar/gen/assets.gen.dart';
import 'package:thimar/models/cities.dart';
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
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final FullNameContoller = TextEditingController();
  CityModel? selectedCity;
  final formkey = GlobalKey<FormState>();
  bool isLoading = false;
  void register() async {
    isLoading = true;
    setState(() {});
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
    if (response!.isSuccess) {
      showmessage(response.message, type: messageType.success);
      navigateTo(
        SendCodeView(
          isActive: true,
          phone: phoneController.text,
        ),
      );
    } else {
      showmessage(response.message);
    }

    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
                key: formkey,
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
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
                      controller: FullNameContoller,
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
                      controller: phoneController,
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
                            selectedCity = result;
                            setState(() {});
                            print("the result is $selectedCity!.name");
                          }
                        },
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: AbsorbPointer(
                                absorbing: true,
                                child: AppInput(
                                  validator: (value) {
                                    if (selectedCity == null) {
                                      return "يجب اختيار مدينتك";
                                    }
                                    return null;
                                  },
                                  labelText: selectedCity?.name ?? "المدينة",
                                  icon: "assets/icons/city_flag.png",
                                  paddingbuttom: 0,
                                ),
                              ),
                            ),
                            if (selectedCity != null)
                              IconButton(
                                onPressed: () {
                                  selectedCity = null;
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
                      controller: passwordController,
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
                      controller: confirmPasswordController,
                      labelText: "كلمة المرور",
                      icon: "assets/icons/lock.png",
                      isObscure: true,
                      paddingbuttom: 24,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "تأكيد  كلمة المرور ضعيفة";
                        } else if (confirmPasswordController.text !=
                            passwordController.text) {
                          return "يجب تطابق كلمتي المرور";
                        }
                        return null;
                      },
                    ),
                    isLoading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        :
                        // : AppButton(
                        //     text: "تسجيل",
                        //     onPress: () {
                        //       if (formkey.currentState!.validate()) {
                        //         register();
                        //       }
                        //     },
                        //   ),
                        FilledButton(
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                register();
                              }
                            },
                            child: Text(
                              "تسجيل",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                    SizedBox(
                      height: 45,
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
  }
}
