import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/features/categories_details/cubit.dart';
import 'package:thimar/features/categories_details/model.dart';
import 'package:thimar/features/categories_details/states.dart';
import 'package:thimar/views/home/view.dart';

import '../../core/design/app_image.dart';
import '../../core/design/app_input.dart';
import '../../core/logic/cache_helper.dart';
import '../../core/logic/helper_methods.dart';
import '../../features/products/cubit.dart';
import '../../gen/assets.gen.dart';
import '../product_details/product_details_view.dart';

class CategoriesDetails extends StatefulWidget {
  final int id;

 const   CategoriesDetails({super.key, required this.id});

  @override
  State<CategoriesDetails> createState() => _CategoriesDetailsState();
}

class _CategoriesDetailsState extends State<CategoriesDetails> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesDetailsCubit()..getData(widget.id),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("خضروات"),
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
                  onPressed: () {Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios),
                  color: Theme.of(context).primaryColor),
            ),
          ),
          body: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16),
                child: AppInput(
                  labelText: "ابحث عن ماتريد؟",
                  icon: Assets.icons.svg.search,
                ),
              ),
              BlocBuilder<CategoriesDetailsCubit, CategoriesDetailsStates>(
                builder: (context, state) {
                  if (state is CategoriesDetailsLoadingState) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is CategoriesDetailsSuccessState) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 3,
                            mainAxisSpacing: 3,
                            childAspectRatio: .6,
                          ),
                          itemCount: state.list.length,
                          itemBuilder: (context, index) =>
                              _ItemCategories(model: state.list[index]),
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

class _ItemCategories extends StatefulWidget {
  final CategoriesDetailsModel model;
  const _ItemCategories({super.key, required this.model});

  @override
  State<_ItemCategories> createState() => _ItemCategoriesState();
}

class _ItemCategoriesState extends State<_ItemCategories> {
  int cart = CacheHelper.getCart();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(11.r),
              child: Stack(alignment: AlignmentDirectional.topEnd, children: [
                GestureDetector(
                  child: AppImage(widget.model.mainImage,),
                  onTap: () {
                    navigateTo(ProductDetails(
                      id: widget.model.id, price: widget.model.price,
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
                onPressed: () {},
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
                cart++;

                CacheHelper.getCount();
                setState(() {});
              },
              child: Text(
                "أضف للسلة",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
