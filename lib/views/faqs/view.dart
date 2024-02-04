import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/views/faqs/cubit.dart';
import 'package:thimar/views/faqs/states.dart';

import '../../core/design/app_image.dart';
import '../../gen/assets.gen.dart';

class FaqsView extends StatefulWidget {
  const FaqsView({super.key});

  @override
  State<FaqsView> createState() => _FaqsViewState();
}

class _FaqsViewState extends State<FaqsView> {
  bool isTextVisible = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => FaqsCubit()..getData(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("أسئلة متكررة"),
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
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                  color: Theme.of(context).primaryColor),
            ),
          ),
          body: ListView(padding: EdgeInsets.all(16.r), children: [
            BlocBuilder<FaqsCubit, FaqsStates>(
              builder: (BuildContext context, state) {
                if (state is FaqsLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is FaqsSuccessState) {
                  return ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11.r),
                      ),
                      child: Column(children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state.list[index].question,
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  isTextVisible = !isTextVisible;
                                  setState(() {});
                                },
                                icon: Container(
                                  height: 20.w,
                                  width: 20.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.r),
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(.13),
                                  ),
                                  child: Transform.rotate(
                                    angle: 1.55,
                                    child: AppImage(
                                      Assets.icons.svg.arrowRight2,
                                      width: 7.w,
                                      height: 3.5.h,
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                        isTextVisible
                            ? Text(
                                state.list[index].answer,
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w300,
                                  color: const Color(0xff828282),
                                ),
                              )
                            : const SizedBox.shrink(),
                      ]),
                    ),
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 16.h),
                    itemCount: state.list.length,
                  );
                } else {
                  return const Text("Data Failed");
                }
              },
            ),
          ]),
        ),
      ),
    );
  }
}
