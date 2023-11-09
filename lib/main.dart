import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/logic/cache_helper.dart';
import 'package:thimar/views/auth/splash/view.dart';
import 'package:thimar/views/counter.dart';
import 'package:thimar/views/home/pages/my_orders/my_orders_view.dart';
import 'package:thimar/views/home/view.dart';
import 'package:thimar/views/order_details/view.dart';
import 'core/constants/constants.dart';
import 'core/logic/helper_methods.dart';
import 'views/about_app/view.dart';
import 'views/political_privacy/view.dart';
import 'views/profile/profile_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: getMyMaterialColor()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            title: "سلة ثمرة",
            theme: ThemeData(
              appBarTheme: getMyAppBarTheme(),
              scaffoldBackgroundColor: Colors.white,
              primarySwatch: getMyMaterialColor(),
              filledButtonTheme: getMyFilledButtonTheme(),
              //  buttonTheme: ButtonThemeData(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
              inputDecorationTheme: getMyInputDecorationTheme(),
              outlinedButtonTheme: getMyOutlinedButtonTheme(),
            ),
            builder: (context, child) => Directionality(
              textDirection: TextDirection.rtl,
              child: child!,
            ),
            debugShowCheckedModeBanner: false,
            navigatorKey: navigateKey,
            home: PoliticalPrivacyView(),
          );
        });
  }
}
