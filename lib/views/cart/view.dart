import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/design/app_button.dart';
import 'package:thimar/core/design/app_image.dart';
import 'package:thimar/features/cart/cubit.dart';
import 'package:thimar/features/cart/model.dart';
import 'package:thimar/features/cart/states.dart';
import 'package:thimar/gen/assets.gen.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CartCubit()..getData(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("السلة"),
            leading: Container(
              height: 32.h,
              width: 32.w,
              padding: EdgeInsets.only(right: 5),
              margin: EdgeInsets.all(8),
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
              padding: EdgeInsetsDirectional.symmetric(horizontal: 17.w),
              children: [
                Column(children: [
                  BlocBuilder<CartCubit, CartStates>(
                    builder: (context, state) {

                      if (state is CartLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is CartSuccessState) {

                        return _Cart(
                          model: state.list,
                        );
                        // return ListView.separated(
                        //   itemBuilder: (context, index) => _Cart(
                        //     model: state.list.data[index],
                        //   ),
                        //   separatorBuilder: (context, index) =>
                        //       SizedBox(height: 10.h),
                        //   itemCount: state.list.data.length,
                        //   scrollDirection: Axis.vertical,
                        //   physics: NeverScrollableScrollPhysics(),
                        //   shrinkWrap: true,
                        // );
                      } else {
                        return const Text("Data Failed");
                      }
                    },
                  ),
                ]),
                SizedBox(height: 12.h),
                Stack(children: [
                  Row(children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                          height: 1.1.h,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w300,
                          color: Color(0xffB9C9A8),
                        ),
                        decoration: InputDecoration(
                          hintText: "عندك كوبون ؟ ادخل رقم الكوبون",
                        ),
                      ),
                    ),
                  ]),
                  Padding(
                    padding: EdgeInsets.only(left: 8, top: 10.5),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 39.h,
                        width: 79.h,
                        child: AppButton(
                          text: "تطبيق",
                          onPress: () {},
                        ),
                      ),
                    ),
                  ),
                ]),
                SizedBox(height: 10.h),
                Center(
                  child: Text(
                    "جميع الأسعار تشمل قيمة الضريبة المضافة 15 %",
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
                SizedBox(height: 14.h),
                Container(
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 9,
                    top: 9,
                  ),
                  height: 135.h,
                  decoration: BoxDecoration(
                    color: Color(0xffF3F8EE),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child:
                  Column(children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
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
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "الخصم",
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          Text(
                            "-40 ر.س",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ]),
                    Divider(color: Color(0xffE2E2E2)),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "المجموع",
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          Text(
                            "140 ر.س",
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ]),
                  ]),
                ),
                SizedBox(height: 11.h),
                AppButton(text: "الانتقال لإتمام الطلب", onPress: () {}),
                SizedBox(height: 10.h),
              ]),
        ),
      ),
    );
  }
}

class _Cart extends StatefulWidget {
  final CartData model;
  const _Cart({super.key, required this.model});

  @override
  State<_Cart> createState() => _CartState();
}

class _CartState extends State<_Cart> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(height: 10.h),
      itemCount: widget.model.data.length,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(6),
          height: 100.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(children: [
              Container(
                height: 78.h,
                width: 92.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: AppImage(
                  widget.model.data[index].image,
                  height: 78.h,
                  width: 92.w,
                ),
              ),
              SizedBox(width: 9.w),
              Column(children: [
                Text.rich(
                  TextSpan(
                    text: widget.model.data[index].title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                    children: [
                      TextSpan(text: "\n"),
                      TextSpan(
                        text: "${widget.model.data[index].price} ر.س",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 6),
                Row(children: [
                  Stack(children: [
                    Container(
                      width: 75.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).primaryColor.withOpacity(.13),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 2,
                        top: 3,
                      ),
                      child: Container(
                        height: 23.h,
                        width: 23.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        child: IconButton(
                          padding: const EdgeInsets.all(0),
                          onPressed: () {
                            count++;
                            setState(() {});
                          },
                          icon: const Icon(Icons.add),
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 33, top: 5),
                      child: Text(
                        count.toString(),
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 52, top: 3),
                      child: Container(
                        height: 23.h,
                        width: 23.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        child: IconButton(
                          padding: const EdgeInsets.all(0),
                          onPressed: () {
                            if (count > 1) {
                              count--;
                              setState(() {});
                            }
                          },
                          icon: const Icon(Icons.remove),
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ]),
                ]),
              ]),
            ]),
            IconButton(
              onPressed: () {},
              icon: AppImage(
                Assets.icons.svg.remove,
              ),
            ),
          ]),
        );
      },
    );
  }
}
