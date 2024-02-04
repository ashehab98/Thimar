// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 import 'package:thimar/core/design/app_image.dart';
import 'package:thimar/core/design/app_input.dart';
 import 'package:thimar/core/logic/helper_methods.dart';
import 'package:thimar/features/categories/cubit.dart';
import 'package:thimar/features/categories/model.dart';
import 'package:thimar/features/categories/states.dart';
import 'package:thimar/features/products/cubit.dart';
import 'package:thimar/features/slider/cubit.dart';
import 'package:thimar/features/slider/states.dart';
import 'package:thimar/gen/assets.gen.dart';
 import 'package:thimar/views/cart/view.dart';
import 'package:thimar/views/categories_details/view.dart';
import 'package:thimar/views/product_details/product_details_view.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => SliderCubit()..getData(),
        ),
        BlocProvider(
          create: (BuildContext context) => CategoriesCubit()..getData(),
        ),
        BlocProvider(
          create: (BuildContext context) => ProductsCubit()..getData(),
        ),
      ],
      child: SafeArea(
        child: Scaffold(
          appBar: MainAppBar(),
          body: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16),
                child: AppInput(
                  labelText: "ابحث عن ماتريد؟",
                  icon: Assets.icons.svg.search,
                ),
              ),
              BlocBuilder<SliderCubit, SliderStates>(
                builder: (context, state) {
                  if (state is GetSliderLoadingState) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is GetSliderSuccessState) {
                    return Column(
                      children: [
                        CarouselSlider(
                          items: List.generate(
                            state.list.length,
                            (index) => AppImage(
                              state.list[index].images,
                              fit: BoxFit.fill,
                              height: 164,
                              width: double.infinity,
                            ),
                          ),
                          options: CarouselOptions(
                            height: 164,
                            autoPlay: true,
                            viewportFraction: 1,
                            onPageChanged: (index, reason) {
                              currentIndex = index;
                              setState(() {});
                            },
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            state.list.length,
                            (index) => Padding(
                              padding: EdgeInsetsDirectional.only(end: 3),
                              child: CircleAvatar(
                                radius: index == currentIndex ? 4.5 : 3.5,
                                backgroundColor: index == currentIndex
                                    ? Theme.of(context).primaryColor
                                    : Color(0xff61B80C),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Text("Failed");
                  }
                },
              ),
              BlocBuilder<CategoriesCubit, CategoriesStates>(
                builder: (context, state) {
                  if (state is CategoriesLoadingState) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is CategoriesSuccessState) {
                    return SizedBox(
                      height: 160,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                "الأقسام",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListView.separated(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              itemBuilder: (context, index) => _ItemCategory(
                                model: state.list[index],
                                index: index,
                              ),
                              separatorBuilder: (context, index) => SizedBox(
                                width: 16,
                              ),
                              itemCount: state.list.length,
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Text("Failed");
                  }
                },
              ),
              BlocBuilder<ProductsCubit, ProductsStates>(
                builder: (context, state) {
                  if (state is ProductsLoadingState) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is ProductsSuccessState) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "الأصناف",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 3,
                            mainAxisSpacing: 3,
                            childAspectRatio: .6,
                          ),
                          itemCount: state.list.length,
                          itemBuilder: (context, index) =>
                              _ItemProducts(model: state.list[index]),
                        ),
                      ],
                    );
                  } else {
                    return Text("Failed");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
int count = 0;

class _ItemProducts extends StatefulWidget {
  final ProductsModel model;
  const _ItemProducts({required this.model});

  @override
  State<_ItemProducts> createState() => _ItemProductsState();
}

class _ItemProductsState extends State<_ItemProducts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17.r),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(11.r),
            child: Stack(alignment: AlignmentDirectional.topEnd, children: [
              GestureDetector(
                child: AppImage(widget.model.mainImage),
                onTap: () {
                  navigateTo(ProductDetails(
                    id: widget.model.id,
                    price: widget.model.price,
                  ));
                },
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 3.h,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadiusDirectional.only(
                    bottomStart: Radius.circular(11.r),
                  ),
                ),
                child: Text(
                  "${widget.model.discount}%",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ]),
          ),
        ),
        SizedBox(height: 3.h),
        Text(
          widget.model.title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        SizedBox(height: 3.h),
        Text(
          "السعر / 1 ${widget.model.unit.name}",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xff808080),
          ),
        ),
        SizedBox(height: 3.h),
        Row(
          children: <Widget>[
            Text(
              "${widget.model.price}",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Text(
              " ر.س",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Text(
              "${widget.model.priceBeforeDiscount} ر.س",
              style: TextStyle(
                decoration: TextDecoration.lineThrough,
                fontWeight: FontWeight.w300,
                fontSize: 13,
                color: Theme.of(context).primaryColor,
              ),
            ),
            IconButton(
              onPressed: () {
                count++;
                setState(() {});
              },
              icon: Icon(
                Icons.add,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(9)),
          width: 115,
          height: 30,
          child: FilledButton(
            onPressed: () {
              count++;
               setState(() {});
            },
            child: Text(
              "أضف للسلة",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ]),
    );
  }
}
class _ItemCategory extends StatelessWidget {
  final CategoryModel model;
  final int index;
  const _ItemCategory({required this.model, required this.index});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 73,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              width: 73,
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(Theme.of(context).primaryColor.value * (index + 1))
                    .withOpacity(.1),
              ),
              child: GestureDetector(
                onTap: () {
                  navigateTo(CategoriesDetails(id: model.id));
                },
                child: AppImage(
                  model.media,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(model.name),
        ],
      ),
    );
  }
}

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {

  const MainAppBar({super.key });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: <Widget>[
            AppImage(
              Assets.images.logo.path,
              height: 21,
              width: 21,
              fit: BoxFit.scaleDown,
            ),
            SizedBox(
              width: 3,
            ),
            Text(
              "سلة ثمار",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            Expanded(
              child: Center(
                child: Text.rich(
                  //  textAlign: TextAlign.center,
                  TextSpan(
                    text: "التوصيل إلى",
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).primaryColor,
                    ),
                    children: [
                      TextSpan(text: "\n"),
                      TextSpan(
                        text: "شارع الملك فهد - جدة",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(.13),
                borderRadius: BorderRadius.circular(9),
              ),
              padding: EdgeInsets.only(
                left: 8,
                right: 7.5,
                top: 8.7,
                bottom: 5.7,
              ),
              height: 33,
              width: 32,
              child: GestureDetector(
                onTap: () {
                  navigateTo(CartView());
                },
                child: Badge(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 0,
                  ),
                  offset: Offset(12, -14),
                  backgroundColor: Theme.of(context).primaryColor,
                  label: Text(
                    count.toString(),
                    style: TextStyle(
                      fontSize: 6,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: AppImage(
                    Assets.icons.svg.cartBag,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70);
}
