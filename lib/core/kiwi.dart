import 'package:kiwi/kiwi.dart';
import 'package:thimar/core/logic/cache_helper.dart';
import 'package:thimar/core/logic/dio_helper.dart';
import 'package:thimar/views/auth/login/cubit.dart';

import '../views/political_privacy/cubit.dart';


void initKiwi(){
  KiwiContainer container = KiwiContainer();

  container.registerSingleton((c) => DioHelper());
  container.registerSingleton((c) => CacheHelper());


 container.registerFactory((c) => LoginCubit());
 container.registerFactory((c) => PolicyCubit());
}

