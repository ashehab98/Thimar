import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/design/app_button.dart';
import 'package:thimar/core/design/app_image.dart';
import 'package:thimar/gen/assets.gen.dart';

class OrderDetailsView extends StatefulWidget {
  const OrderDetailsView({super.key});

  @override
  State<OrderDetailsView> createState() => _OrderDetailsViewState();
}

class _OrderDetailsViewState extends State<OrderDetailsView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("تفاصيل الطلب"),
          leading: Container(
            height: 32.h,
            width: 32.w,
            padding: EdgeInsets.only(right: 5.w),
            margin: EdgeInsets.all(8.sp),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9.r),
              color: Theme.of(context).primaryColor.withOpacity(.13),
            ),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios),
                color: Theme.of(context).primaryColor),
          ),
        ),
        body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 22.h),
            children: [
              _Item(),
              SizedBox(height: 16.h),
              Text(
                "عنوان التوصيل",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              SizedBox(height: 19.h),
              _Location(),
              SizedBox(height: 16.h),
              Text(
                "ملخص الطلب",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              SizedBox(height: 19.h),
              _OrderSummary(),

              AppButton(text: "إلغاء الطلب", onPress: () {

              },),
            ]),
      ),
    );
  }
}

class _Item extends StatefulWidget {
  const _Item({super.key});

  @override
  State<_Item> createState() => _ItemState();
}

class _ItemState extends State<_Item> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 121.h,
      padding:
          EdgeInsets.only(left: 9.w, right: 10.w, top: 5.h, bottom: 13.5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: Colors.grey.withOpacity(.039)),
      ),
      child: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(children: [
            Text(
              "طلب #4587",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17.sp,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Text(
              "27,يونيو,2021",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 14.sp,
                color: Color(0xff9C9C9C),
              ),
            ),
          ]),
          Column(children: [
            Container(
              height: 23.h,
              width: 95.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Color(0xffEDF5E6),
              ),
              child: Center(
                child: Text(
                  "بإنتظار الموافقة",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Text(
              "180 ر.س",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ]),
        ]),
        Divider(
          color: Color(0xffF3F3F3),
          thickness: .39,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(children: [
            ...List.generate(
              3,
              (index) => Container(
                margin: EdgeInsetsDirectional.only(end: 3),
                height: 25.h,
                width: 25.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.r),
                  border: Border.all(
                      width: .5,
                      color: Theme.of(context).primaryColor.withOpacity(.13)),
                ),
                child: AppImage(Assets.images.potato.path),
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(end: 3),
              height: 25.h,
              width: 25.w,
              decoration: BoxDecoration(
                color: Color(0xffEDF5E6),
                borderRadius: BorderRadius.circular(7.r),
                border: Border.all(
                    width: .5,
                    color: Theme.of(context).primaryColor.withOpacity(.13)),
              ),
              child: Center(
                  child: Text(
                "+2",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                ),
              )),
            ),
          ]),
          GestureDetector(
            onTap: () {},
            child: Container(
              // padding: EdgeInsets.only(left: 11.w),

              margin: EdgeInsetsDirectional.only(end: 3.w),
              height: 24.h,
              width: 24.w,
              decoration: BoxDecoration(
                color: Color(0xffEDF5E6),
                borderRadius: BorderRadius.circular(6.r),
                border: Border.all(
                    width: .5,
                    color: Theme.of(context).primaryColor.withOpacity(.13)),
              ),
              child: IconButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 15,
                  ),
                  color: Theme.of(context).primaryColor),
            ),
          ),
        ]),
      ]),
    );
  }
}

class _Location extends StatefulWidget {
  const _Location({super.key});

  @override
  State<_Location> createState() => _LocationState();
}

class _LocationState extends State<_Location> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      height: 95.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.grey.withOpacity(.039),
        ),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "المنزل",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "شقة 40",
            style: TextStyle(
              color: Color(0xff999797),
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            "شارع العليا الرياض 2521 السعودية",
            style: TextStyle(
              color: Color(0xff000000),
              fontSize: 12.sp,
              fontWeight: FontWeight.w300,
            ),
          ),
        ]),
        Container(
          height: 62.h,
          width: 72.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            //color: Theme.of(context).primaryColor.withOpacity(.13),
          ),
          child: AppImage(
            Assets.images.locations.path,
            height: 62.h,
            width: 72.w,
          ),
        ),
      ]),
    );
  }
}

class _OrderSummary extends StatefulWidget {
  const _OrderSummary({super.key});

  @override
  State<_OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<_OrderSummary> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 16.w,
        right: 9.w,
        top: 9.h,
      ),
      height: 167.h,
      decoration: BoxDecoration(
        color: Color(0xffF3F8EE),
        borderRadius: BorderRadius.circular(13.r),
      ),
      child: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            "إجمالي المنتجات",
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).primaryColor,
            ),
          ),
          Text(
            "180 ر.س",
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ]),
        SizedBox(height: 11.h),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            "سعر التوصيل",
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).primaryColor,
            ),
          ),
          Text(
            "40 ر.س",
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ]),
        Divider(color: Color(0xffE2E2E2), thickness: .5),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            "المجموع",
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).primaryColor,
            ),
          ),
          Text(
            "220 ر.س",
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ]),
        Divider(color: Color(0xffE2E2E2), thickness: 1),
        Row(children: [
          Text(
            "تم الدفع بواسطة",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(width: 16.w),
          AppImage(Assets.images.visa.path),
        ]),
      ]),
    );
  }
}
