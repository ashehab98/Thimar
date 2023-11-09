// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

MaterialColor getMyMaterialColor() {
  Color color = Color(0xff4C8613);

  return MaterialColor(
    color.value,
    {
      50: color.withOpacity(.1),
      100: color.withOpacity(.2),
      200: color.withOpacity(.3),
      300: color.withOpacity(.4),
      400: color.withOpacity(.5),
      500: color.withOpacity(.6),
      600: color.withOpacity(.7),
      700: color.withOpacity(.8),
      800: color.withOpacity(.9),
      900: color,
    },
  );
}

FilledButtonThemeData getMyFilledButtonTheme() {
  return FilledButtonThemeData(
    style: FilledButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
      fixedSize: const Size.fromHeight(60),
    ),
  );
}

InputDecorationTheme getMyInputDecorationTheme() {
  return InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        color: Color(0xffF3F3F3),
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        color: Color(0xffF3F3F3),
      ),
    ),
    filled: true,
    fillColor: Colors.white,
  );
}

OutlinedButtonThemeData getMyOutlinedButtonTheme() {
  return OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      side: BorderSide(
        color: getMyMaterialColor(),
      ),
    ),
  );
}

  AppBarTheme getMyAppBarTheme() {
    return AppBarTheme(
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: getMyMaterialColor(),
        fontSize: 20,
        fontWeight: FontWeight.bold,
        
      ),
      
    );
}
