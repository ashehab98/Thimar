// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, sized_box_for_whitespace, unused_local_variable, non_constant_identifier_names

import 'dart:io';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:thimar/core/design/app_button.dart';
import 'package:thimar/views/auth/new_password/view.dart';
import 'package:thimar/views/auth/send_code/cubit.dart';

import '../../../core/logic/dio_helper.dart';
import '../../../core/logic/helper_methods.dart';
import '../login/view.dart';

class SendCodeView extends StatefulWidget {
  final bool isActive;
  final String phone;

  const SendCodeView({
    super.key,
    required this.phone,
    required this.isActive,
  });

  @override
  State<SendCodeView> createState() => _SendCodeViewState();
}

class _SendCodeViewState extends State<SendCodeView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SendCodeCubit(),
      child: Builder(builder: (context) {
        SendCodeCubit cubit = BlocProvider.of(context);
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
                    key: formKey,
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
                          widget.isActive ? "تفعيل الحساب" : "نسيت كلمة المرور",
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
                          "أدخل الكود المكون من 4 أرقام المرسل علي رقم الجوال",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Color(0xff707070),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "${widget.phone}",
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Color(0xff707070),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "تغيير رقم الجوال",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),

                        PinCodeTextField(
                          controller: cubit.codeController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "ادخل الكود";
                            }
                            return null;
                          },
                          appContext: context,
                          length: 4,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(15),
                            fieldHeight: 60,
                            fieldWidth: 70,
                            selectedColor: Theme.of(context).primaryColor,
                            inactiveColor: Color(0xfff3f3f3),
                          ),
                          keyboardType: TextInputType.number,
                        ),

                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: <Widget>[
                        //     SizedBox(
                        //       height: 70,
                        //       width: 70,
                        //       child: TextFormField(
                        //         onSaved: (pin1) {},
                        //         onChanged: (value) {
                        //           if (value.length == 1) {
                        //             FocusScope.of(context).nextFocus();
                        //           }
                        //         },
                        //         decoration: const InputDecoration(
                        //             border: OutlineInputBorder()),
                        //         style: Theme.of(context).textTheme.headlineSmall,
                        //         keyboardType: TextInputType.number,
                        //         textAlign: TextAlign.center,
                        //         inputFormatters: [
                        //           LengthLimitingTextInputFormatter(1),
                        //           FilteringTextInputFormatter.digitsOnly,
                        //         ],
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       height: 70,
                        //       width: 70,
                        //       child: TextFormField(
                        //         onSaved: (pin2) {},
                        //         onChanged: (value) {
                        //           if (value.length == 1) {
                        //             FocusScope.of(context).nextFocus();
                        //           }
                        //         },
                        //         decoration: const InputDecoration(
                        //             border: OutlineInputBorder()),
                        //         style: Theme.of(context).textTheme.headlineSmall,
                        //         keyboardType: TextInputType.number,
                        //         textAlign: TextAlign.center,
                        //         inputFormatters: [
                        //           LengthLimitingTextInputFormatter(1),
                        //           FilteringTextInputFormatter.digitsOnly,
                        //         ],
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       height: 70,
                        //       width: 70,
                        //       child: TextFormField(
                        //         onSaved: (pin3) {},
                        //         onChanged: (value) {
                        //           if (value.length == 1) {
                        //             FocusScope.of(context).nextFocus();
                        //           }
                        //         },
                        //         decoration: const InputDecoration(
                        //             border: OutlineInputBorder()),
                        //         style: Theme.of(context).textTheme.headlineSmall,
                        //         keyboardType: TextInputType.number,
                        //         textAlign: TextAlign.center,
                        //         inputFormatters: [
                        //           LengthLimitingTextInputFormatter(1),
                        //           FilteringTextInputFormatter.digitsOnly,
                        //         ],
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       height: 70,
                        //       width: 70,
                        //       child: TextFormField(
                        //         onSaved: (pin4) {},
                        //         onChanged: (value) {
                        //           if (value.length == 1) {
                        //             FocusScope.of(context).nextFocus();
                        //           }
                        //         },
                        //         decoration: const InputDecoration(
                        //             border: OutlineInputBorder()),
                        //         style: Theme.of(context).textTheme.headlineSmall,
                        //         keyboardType: TextInputType.number,
                        //         textAlign: TextAlign.center,
                        //         inputFormatters: [
                        //           LengthLimitingTextInputFormatter(1),
                        //           FilteringTextInputFormatter.digitsOnly,
                        //         ],
                        //       ),
                        //     ),
                        //   ],
                        // ),

                        SizedBox(
                          height: 37,
                        ),
                        BlocBuilder(
                          bloc: cubit,
                          builder: (context, state) {
                            return AppButton(
                              text: "تأكيد الكود",
                              onPress: () {
                                cubit.verify;
                              },
                            );
                          },
                        ),

                        SizedBox(
                          height: 27,
                        ),
                        Text(
                          "لم تستلم الكود ؟\nيمكنك إعادة إرسال الكود بعد",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Color(0xff707070),
                            height: 2,
                          ),
                        ),
                        SizedBox(
                          height: 22,
                        ),

                        cubit.isTimerFineshed
                            ? Center(
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(),
                                  onPressed: () {
                                    cubit.isTimerFineshed = false;
                                    setState(() {});
                                  },
                                  child: Text("إعادة الإرسال"),
                                ),
                              )
                            : CircularCountDownTimer(
                                duration: 5,
                                initialDuration: 0,
                                controller: CountDownController(),
                                width: 66,
                                height: 69,
                                ringColor: Theme.of(context).primaryColor,
                                fillColor: Color(0xffD8D8D8),
                                strokeWidth: 3.0,
                                textStyle: TextStyle(
                                    fontSize: 21.0,
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold),
                                textFormat: CountdownTextFormat.MM_SS,
                                isReverseAnimation: true,
                                onComplete: () {
                                  cubit.isTimerFineshed = true;
                                  setState(() {});
                                },
                              ),

                        // Center(
                        //   child: SizedBox(
                        //     width: 66,
                        //     height: 69.45,
                        //     child: Stack(
                        //       fit: StackFit.expand,
                        //       children: <Widget>[
                        //         CircularProgressIndicator(
                        //           strokeWidth: 3,
                        //           value: ((currentSecond).round() - 1) / duration,
                        //           backgroundColor: Color(0xffD8D8D8),
                        //         ),
                        //         Center(
                        //           child: Text(
                        //             "${(currentSecond).round() - 1}",
                        //             style: TextStyle(
                        //               fontSize: 21,
                        //               color: Theme.of(context).primaryColor,
                        //             ),
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),

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
      }),
    );
  }
}
