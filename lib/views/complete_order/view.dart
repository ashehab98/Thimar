import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/design/app_image.dart';
import '../../gen/assets.gen.dart';

class CompleteOrderView extends StatefulWidget {
  const CompleteOrderView({
    super.key,
  });

  @override
  State<CompleteOrderView> createState() => _CompleteOrderViewState();
}

class _CompleteOrderViewState extends State<CompleteOrderView> {
  late Color color;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("إتمام الطلب"),
          leading: Container(
            height: 32.h,
            width: 32.w,
            padding: EdgeInsets.only(right: 5.w),
            margin: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9.r),
              color: Theme.of(context).primaryColor.withOpacity(.13),
            ),
            child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_back_ios),
                color: Theme.of(context).primaryColor),
          ),
        ),
        body: ListView(padding: EdgeInsets.all(16.r), children: [
          SizedBox(height: 15.h),
          Row(children: [
            Text(
              "الإسم : ",
              style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
            Text(
              "عبدالرحمن",
              style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
          ]),
          Row(children: [
            Text(
              "الجوال : ",
              style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
            Text(
              "01096983611",
              style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
          ]),
          SizedBox(height: 37.h),
          Container(
            padding: EdgeInsets.only(left: 4.w),
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  "اختر عنوان التوصيل",
                  style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                ),
                Container(
                  height: 26.h,
                  width: 26.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.r),
                    color: Theme.of(context).primaryColor.withOpacity(.13),
                  ),
                  child: Icon(
                    Icons.add,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ]),
              SizedBox(height: 18.h),
              Container(
                padding: EdgeInsets.only(right: 13.w, left: 22.2.w),
                height: 33.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17.r),
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "المنزل : 119 طريق الملك عبدالعزيز",
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Transform.rotate(
                        angle: 1.55,
                        child: AppImage(
                          Assets.icons.svg.arrowRight2,
                          width: 40.w,
                          height: 20.h,
                        ),
                      ),
                    ]),
              ),
            ]),
          ),
          SizedBox(height: 32.h),
          Container(
            padding: EdgeInsets.only(left: 1.w),
            height: 105.h,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "تحديد وقت التوصيل",
                style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
              SizedBox(height: 13.h),
              Row(children: [
                Container(
                  padding: EdgeInsets.all(16.r),
                  width: 163.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(
                      color: Color(0xffF3F3F3),
                    ),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "اختر اليوم والتاريخ",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 15.sp,
                          ),
                        ),
                        AppImage(Assets.icons.svg.calender),
                      ]),
                ),
                SizedBox(width: 16.w),
                Container(
                  padding: EdgeInsets.all(16.r),
                  width: 163.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(
                      color: Color(0xffF3F3F3),
                    ),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "اختر الوقت",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 15.sp,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        AppImage(Assets.icons.svg.time),
                      ]),
                ),
              ]),
            ]),
          ),
          SizedBox(height: 22.h),
          Container(
            padding: EdgeInsets.only(left: 1.w),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "ملاحظات وتعليمات",
                style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
              TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
            ]),
          ),
          SizedBox(height: 25.5.h),
          SizedBox(
            height: 101.h,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "اختر طريقة الدفع",
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(height: 19.h),
              Row(children: [

                 Container(
                  height: 50.h,
                  width: 104.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11.r),
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  child: Row(children: [
                    Padding(padding: EdgeInsets.only(right: 13.w)),
                    AppImage(Assets.icons.svg.money),
                    SizedBox(width: 7.w),
                    Text(
                      "كاش",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ]),
                ),
                SizedBox(width: 15.7.w),
                Container(
                  height: 50.h,
                  width: 104.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11.r),
                    border: Border.all(
                      color: Color(0xffE9E9E9),
                    ),
                  ),
                  child: AppImage(Assets.icons.svg.visa),
                ),
                SizedBox(width: 15.7.w),
                Container(
                  height: 50.h,
                  width: 104.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11.r),
                    border: Border.all(
                      color: Color(0xffE9E9E9),
                    ),
                  ),
                  child: AppImage(Assets.icons.svg.mastercard),
                ),
              ]),
            ]),
          ),
        ]),
      ),
    );
  }
}
