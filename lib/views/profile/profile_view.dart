
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/design/app_image.dart';
import 'package:thimar/core/design/app_input.dart';
import 'package:thimar/gen/assets.gen.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("البيانات الشخصية"),
        leading: Container(
          height: 32,
          width: 32,
          padding: const EdgeInsets.only(right: 5),
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            color: Theme.of(context).primaryColor.withOpacity(.13),
          ),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },              icon: const Icon(Icons.arrow_back_ios),
              color: Theme.of(context).primaryColor),
        ),
      ),
      body: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
          ),
          children: [
            Center(
              child: Column(children: [
                Container(
                  height: 85.h,
                  width: 85.h,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Stack(
                    children: [
                      ColorFiltered(
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(.32), BlendMode.darken),
                        child: AppImage(
                          Assets.images.potato.path,
                          height: 85.h,
                          width: 85.h,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Center(child: AppImage(Assets.icons.svg.camera))
                    ],
                  ),
                ),
                SizedBox(height: 3.h),
                Text(
                  "محمد علي",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(height: 3.h),
                const Text(
                  "+96654787856",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    fontSize: 17,
                    color: Color(0xffA7A7A7),
                  ),
                ),
              ]),
            ),
            SizedBox(height: 18.h),
            AppInput(
              labelText: "اسم المستخدم",
              icon: Assets.icons.person.path,
            )
          ]),
    );
  }
}
