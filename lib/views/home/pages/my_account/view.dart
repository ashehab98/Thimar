import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/design/app_image.dart';
import 'package:thimar/core/design/my_account_button.dart';
import 'package:thimar/core/logic/cache_helper.dart';
import 'package:thimar/core/logic/helper_methods.dart';
import 'package:thimar/features/logout/cubit.dart';
import 'package:thimar/features/logout/states.dart';
import 'package:thimar/views/about_app/view.dart';
import 'package:thimar/views/addresses/view.dart';
import 'package:thimar/views/faqs/view.dart';
import 'package:thimar/views/home/pages/main/view.dart';
import 'package:thimar/views/political_privacy/view.dart';
import 'package:thimar/views/profile/profile_view.dart';

import '../../../../gen/assets.gen.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({super.key});

  @override
  State<MyAccountPage> createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogOutCubit(),
      child: Builder(builder: (context) {
        LogOutCubit cubit = BlocProvider.of(context);
        return SafeArea(
          child: Stack(children: [
            Scaffold(
              appBar: AppBar(
                title: Text(
                  "حسابي",
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Theme.of(context).primaryColor,
                centerTitle: true,
              ),
              body: ListView(children: [
                Container(
                  height: 130.h,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(40.r),
                      bottomLeft: Radius.circular(40.r),
                    ),
                  ),
                  child: Column(children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      height: 71.h,
                      width: 76.w,
                      child: AppImage(
                        Assets.images.potato.path,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      "محمد علي",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "+96654787856",
                      style: TextStyle(
                        color: Color(0xffA2D273),
                        fontSize: 14,
                      ),
                      textDirection: TextDirection.ltr,
                    ),
                  ]),
                ),
                SizedBox(height: 3.h),
                Padding(
                  padding: EdgeInsets.all(16.0.sp),
                  child: Column(children: [
                    Container(
                      height: 192.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17.r),
                      ),
                      child: Column(children: [
                        InkWell(
                          child: MyAccountButton(
                            text: "البيانات الشخصية",
                            image: Assets.icons.svg.personalInformation,

                          ),
                          onTap: () {
                            navigateTo(ProfileView());

                          },
                        ),
                        MyAccountButton(
                          text: "المحفظة",
                          image: Assets.icons.svg.wallet,
                         ),
                        InkWell(
                          child: MyAccountButton(
                            text: "العناوين",
                            image: Assets.icons.svg.location,

                          ),
                          onTap: () {
                            navigateTo(AddressesView());

                          },
                        ),
                        MyAccountButton(
                          text: "الدفع",
                          image: Assets.icons.svg.pay,
                         ),
                      ]),
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      height: 240.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17.r),
                      ),
                      child: Column(children: [
                        InkWell(
                          child: MyAccountButton(
                            text: "أسئلة متكررة",
                            image: Assets.icons.svg.question,

                          ),
                          onTap: () {
                              navigateTo(FaqsView());
                          },
                        ),
                        InkWell(
                          child: MyAccountButton(
                            text: "سياسة الخصوصية",
                            image: Assets.icons.svg.check,

                          ),
                          onTap: () {
                            navigateTo(PoliticalPrivacyView());

                          },
                        ),
                        MyAccountButton(
                          text: "تواصل معنا",
                          image: Assets.icons.svg.contantUs,
                         ),
                        MyAccountButton(
                          text: "الشكاوي والأقتراحات",
                          image: Assets.icons.svg.suggestion,
                         ),
                        MyAccountButton(
                          text: "مشاركة التطبيق",
                          image: Assets.icons.svg.shareApp,
                         ),
                      ]),
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      height: 200.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17.r),
                      ),
                      child: Column(children: [
                        InkWell(
                          child: MyAccountButton(
                            text: "عن التطبيق",
                            image: Assets.icons.svg.aboutApp,

                          ),
                          onTap: () {
                            navigateTo(AboutAppView());

                          },
                        ),
                        MyAccountButton(
                          text: "تغيير اللغة",
                          image: Assets.icons.svg.changeLanguage,
                         ),
                        MyAccountButton(
                          text: "الشروط والأحكام",
                          image: Assets.icons.svg.condition,
                         ),
                        MyAccountButton(
                          text: "تقييم التطبيق",
                          image: Assets.icons.svg.rateApp,
                         ),
                      ]),
                    ),
                    SizedBox(height: 10.h),
                    GestureDetector(
                      onTap: () {
                        LogOutCubit().logOut();
                      },
                      child: Container(
                        height: 48.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17.r),
                        ),
                        child: BlocBuilder<LogOutCubit, LogOutStates>(
                          builder: (context, state) => MyAccountButton(
                            text: "تسجيل الخروج",
                            image: Assets.icons.svg.turnOff,
                           ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ]),
            ),
            AppImage(
              Assets.images.pubbles.path,
              width: 375.w,
              fit: BoxFit.fill,
            ),
          ]),
        );
      }),
    );
  }
}
