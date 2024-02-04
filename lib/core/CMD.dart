// start firebase in project
// dart pub global activate flutterfire_cli
// flutterfire configure
// package : firebase_core
// package : firebase_messaging
// code :--->>>> in main.dart
// WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//       options: DefaultFirebaseOptions.currentPlatform
//   );
//   FirebaseMessaging.instance.getToken().then((value) {
//     print(value);
//   });
// build grade :    >>>
// dependencies {
// implementation 'com.google.firebase:firebase-analytics:17.2.2'
// }



// Localization ------->
// flutter pub run easy_localization:generate -S assets/translations
// flutter pub run easy_localization:generate -S assets/translations -f keys -o locale_keys.g.dart
