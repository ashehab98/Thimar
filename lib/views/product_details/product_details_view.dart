import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/design/app_image.dart';
import 'package:thimar/core/logic/helper_methods.dart';
import 'package:thimar/features/add_to_fav/cubit.dart';
import 'package:thimar/features/product_details/cubit.dart';
import 'package:thimar/features/rates/cubit.dart';
import 'package:thimar/features/rates/states.dart';
import 'package:thimar/gen/assets.gen.dart';
import 'package:thimar/views/home/pages/fav/view.dart';
import 'package:thimar/views/home/pages/main/view.dart';

import '../../core/logic/cache_helper.dart';
import '../rates/rates_view.dart';

class ProductDetails extends StatefulWidget {
  final int id;
  final double price;
  const ProductDetails({
    super.key,
    required this.id,
    required this.price,
  });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int count = 1;
  int fav = CacheHelper.getFav();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) =>
              ProductDetailsCubit()..getData(widget.id),
        ),
        BlocProvider(
          create: (BuildContext context) => RatesCubit()..getData(widget.id),
        ),
        BlocProvider(
          create: (context) => AddToFavCubit(),
        ),
      ],
      child: Builder(builder: (context) {
        AddToFavCubit cubit = BlocProvider.of(context);
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              actions: [
                Container(
                  height: 32.h,
                  width: 32.w,
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: Theme.of(context).primaryColor.withOpacity(.13),
                  ),
                  child: BlocBuilder(
                    bloc: cubit,
                    builder: (context, state) => IconButton(
                      onPressed: () {
                        CacheHelper.getFav();
                        setState(() {});
                      },
                      icon: AppImage(Assets.icons.svg.fav),
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
              leading: Container(
                height: 32.h,
                width: 32.w,
                padding: const EdgeInsets.only(right: 5),
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: Theme.of(context).primaryColor.withOpacity(.13),
                ),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                    color: Theme.of(context).primaryColor),
              ),
            ),
            body: ListView(shrinkWrap: true, children: [
              BlocBuilder<ProductDetailsCubit, ProductDetailsStates>(
                  builder: (context, state) {
                if (state is ProductDetailsLoadingStates) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ProductDetailsSuccessStates) {
                  return Column(children: [
                    SizedBox(
                      width: 375.w,
                      height: 145.h,
                      child: AppImage(
                        state.list.data.mainImage,
                        width: 375.w,
                        height: 145.h,
                      ),
                    ),
                    SizedBox(height: 14.h),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${state.list.data.title}",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                                text: "%${state.list.data.discount}   ",
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffFF0000),
                                ),
                                children: [
                                  TextSpan(
                                    text: " ${state.list.data.price}ر.س  ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        "${state.list.data.priceBeforeDiscount}ر.س",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                        color: Theme.of(context).primaryColor,
                                        decoration: TextDecoration.lineThrough),
                                  ),
                                ]),
                          ),
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "السعر / ${state.list.data.unit.name}",
                            style: const TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff808080),
                            ),
                          ),
                          Stack(children: [
                            Container(
                              width: 109.w,
                              height: 35.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(.13),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 5,
                                top: 3,
                                bottom: 3,
                              ),
                              child: Container(
                                height: 29.h,
                                width: 29.w,
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
                              padding: const EdgeInsets.only(right: 51, top: 8),
                              child: Text(
                                count.toString(),
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 78, top: 3),
                              child: Container(
                                height: 29.h,
                                width: 29.w,
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
                    SizedBox(height: 12.5.h),
                    const Divider(),
                    Row(children: [
                      Text(
                        "كود المنتج",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      SizedBox(width: 14.w),
                      Text(
                        "${state.list.data.code}",
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff808080),
                        ),
                      ),
                    ]),
                    SizedBox(height: 18.5.h),
                    const Divider(),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "تفاصيل المنتج",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          Text(
                            state.list.data.description,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff757575),
                            ),
                          ),
                        ]),
                    SizedBox(height: 16.h),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "التقييمات",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "عرض الكل",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ))
                        ]),
                    const SizedBox(height: 12),
                  ]);
                } else {
                  return const Text("data faild");
                }
               }),
              BlocBuilder<RatesCubit, RatesStates>(builder: (context, state) {
                if (state is RatesLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is RatesSuccessState &&
                    state.list.data.isNotEmpty) {
                  return Container(
                    height: 400.h,
                    width: double.infinity,
                    child: ListView.separated(

                        physics: const NeverScrollableScrollPhysics(),

                        scrollDirection: Axis.horizontal,
                        itemCount: state.list.data.length,
                        separatorBuilder: (context, index) => SizedBox(
                              width: 8.w,
                            ),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          RatesView(
                              clientName: state.list.data[index].clientName,
                              clientImage: state.list.data[index].clientImage,
                              value: state.list.data[index].value,
                              comment: state.list.data[index].comment);
                        }),
                  );
                } else {
                  return Text("Data failed");
                }
              }),
            ]),
            bottomNavigationBar: Container(
              height: 60.h,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 15, bottom: 14, right: 27, left: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        AppImage(Assets.icons.svg.cartShopping),
                        SizedBox(width: 10.w),
                        const Text(
                          "إضافة إلي السلة",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffFFFFFF)),
                        ),
                      ]),
                      Text(
                        "${count * widget.price} ر.س",
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffFFFFFF)),
                      ),
                    ]),
              ),
            ),
          ),
        );
      }),
    );
  }
}
