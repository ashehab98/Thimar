// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unused_local_variable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:thimar/core/design/app_input.dart';
import 'package:thimar/core/logic/dio_helper.dart';

import '../../../core/logic/helper_methods.dart';
import '../login/view.dart';
import '../send_code/view.dart';

class ForgetPaswwordView extends StatefulWidget {
  const ForgetPaswwordView({super.key});

  @override
  State<ForgetPaswwordView> createState() => _ForgetPaswwordViewState();
}

class _ForgetPaswwordViewState extends State<ForgetPaswwordView> {
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  void ForgetPassword() async {
    isLoading = true;
    setState(() {});
    final response = await DioHelper().sendData("forget_password", data: {
      "phone": phoneController.text,
    });
    if (response!.isSuccess) {
      showmessage(response.message, type: messageType.success);
      navigateTo(SendCodeView(phone: phoneController.text, isActive: false));
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
            "assets/images/splash_bg.png",
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
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
                    "أدخل رقم الجوال المرتبط بحسابك",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Color(0xff707070),
                    ),
                  ),
                  Form(
                    key: formKey,
                    child: AppInput(
                      controller: phoneController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "رقم الهاتف مطلوب";
                        } else if (value.length < 9) {
                          return "يجب الا يقل رقم الهاتف عن 9 أرقام";
                        }
                        return null;
                      },
                      // controller: phoneController,
                      labelText: "رقم الجوال",
                      icon: "assets/icons/phone.png",
                      isPhone: true,
                      paddingbuttom: 21,
                      paddingtop: 28,
                    ),
                  ),
                  FilledButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        ForgetPassword();
                      }
                    },
                    child: Text(
                      "تأكيد رقم الجوال",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
        ],
      ),
    );
  }
}
