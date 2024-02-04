// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:thimar/core/logic/dio_helper.dart';
import 'package:thimar/core/logic/helper_methods.dart';
import 'package:thimar/views/auth/login/view.dart';

import '../../../core/design/app_input.dart';

class NewPasswordView extends StatefulWidget {
  const NewPasswordView({super.key});

  @override
  State<NewPasswordView> createState() => _NewPasswordViewState();
}

class _NewPasswordViewState extends State<NewPasswordView> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final CodeController = TextEditingController();
  bool isLoading = false;
  final formkey = GlobalKey<FormState>();
  void NewPassword() async {
    isLoading = true;
    setState(() {});
    final response = await DioHelper().sendData("reset_password", data: {
      "phone": phoneController.text,
      "code": CodeController.text,
      "password": passwordController.text,
    });
    if (response.isSuccess) {
      showmessage(response.message, type: messageType.success);
      navigateTo(LoginView());
    } else {
      showmessage(response.message);
    }
    isLoading = false;
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Image.asset(
            "assets/images/splash_bg.png",
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
                      "نسيت كلمة المرور",
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
                      "أدخل كلمة المرور الجديدة",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff707070),
                      ),
                    ),
                    AppInput(
                      controller: passwordController,
                      labelText: "كلمة المرور",
                      icon: "assets/icons/lock.png",
                      isPhone: false,
                      paddingbuttom: 16,
                      isObscure: true,
                      paddingtop: 17,
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
                      isPhone: false,
                      paddingbuttom: 25,
                      isObscure: true,
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
                    FilledButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          navigateTo(LoginView());
                        }
                      },
                      child: Text(
                        "تغيير كلمة المرور",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
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
                          onPressed: () {},
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
