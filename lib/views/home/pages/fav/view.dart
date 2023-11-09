import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/design/app_image.dart';
import '../../../../core/logic/cache_helper.dart';
import '../../../../core/logic/helper_methods.dart';
import '../../../../features/fav_details/cubit.dart';
import '../../../../features/fav_details/model.dart';
import '../../../../features/fav_details/states.dart';
import '../../../../features/products/cubit.dart';
import '../../../product_details/product_details_view.dart';

class FavPage extends StatefulWidget {
  const FavPage({super.key});

  @override
  State<FavPage> createState() => _FavPageState();
}
  
class _FavPageState extends State<FavPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => FavDetailsCubit()..getData(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("المفضلة"),
           ),
          body: ListView(
            padding: EdgeInsets.all(16),
              children: [
                BlocBuilder<FavDetailsCubit, FavDetailsStates>(
                  builder: (context, state) {
                    if (state is FavDetailsLoadingState) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is FavDetailsSuccessState) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

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
                                _FavDetailsItem(model: state.list, index: index,),
                          ),
                        ],
                      );
                    } else {
                      return Text("Failed");
                    }
                  },
                ),

              ]),
        ),
      ),
    );
   }
}

class _FavDetailsItem extends StatefulWidget {
  final List<FavDetailsModel> model;
  final int index;
  const _FavDetailsItem({super.key, required this.model, required this.index});

  @override
  State<_FavDetailsItem> createState() => __FavDetailsItemState();
}

class __FavDetailsItemState extends State<_FavDetailsItem> {

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
                  child: AppImage(widget.model[widget.index].mainImage),
                  onTap: () {

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
                    "${widget.model[widget.index].discount}%",
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
            widget.model[widget.index].title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
          SizedBox(height: 3.h),
          Text(
            "السعر / 1 ${widget.model[widget.index].unit}",
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
                "${widget.model[widget.index].price}",
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
                "${widget.model[widget.index].priceBeforeDiscount} ر.س",
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