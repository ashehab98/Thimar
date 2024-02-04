import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/kiwi.dart';
import 'package:thimar/core/logic/cache_helper.dart';
import 'package:thimar/firebase_options.dart';
import 'core/constants/constants.dart';
import 'core/logic/helper_methods.dart';
import 'generated/codegen_loader.g.dart';
import 'views/complete_order/view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initKiwi();
  await EasyLocalization.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FirebaseMessaging.instance.getToken().then((value) {
    print("FCM token ${"+" * 50}");
    print(value);
  });
  await CacheHelper.init();

  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: getMyMaterialColor()));
  runApp(
    EasyLocalization(
        assetLoader: const CodegenLoader(),
        saveLocale: true,
        startLocale: const Locale("ar"),
        supportedLocales: const [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        fallbackLocale: const Locale('ar'),
        child: const MyApp()),
  );
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
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
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
            debugShowCheckedModeBanner: false,
            navigatorKey: navigateKey,
            home: const CompleteOrderView(),
          );
        });
  }
}