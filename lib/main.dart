// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'core/constants/constants.dart';
import 'core/logic/helper_methods.dart';
import 'views/auth/login/view.dart';
import 'views/counter.dart';
import 'views/home/pages/my_orders/view.dart';
import 'views/home/view.dart';
import 'views/suggestions_and_complaints/view.dart';

late final SharedPreferences prefs;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
    prefs = await SharedPreferences.getInstance();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: getMyMaterialColor()
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: getMyAppBarTheme(),
        
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: getMyMaterialColor(),
        filledButtonTheme: getMyFilledButtonTheme(),
        //  buttonTheme: ButtonThemeData(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
        inputDecorationTheme: getMyInputDecorationTheme(),
        outlinedButtonTheme: getMyOutlinedButtonTheme(),
      ),
      builder: (context, child) =>
          Directionality(textDirection: TextDirection.rtl, child: child!),
      debugShowCheckedModeBanner: false,
      navigatorKey: navigateKey,
      home: LoginView(),
    );
  }
}
