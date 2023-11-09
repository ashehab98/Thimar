import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/design/app_button.dart';
import 'package:thimar/core/design/app_image.dart';
import 'package:thimar/core/logic/helper_methods.dart';

import '../../gen/assets.gen.dart';

class AddressesView extends StatefulWidget {
  const AddressesView({super.key});

  @override
  State<AddressesView> createState() => _AddressesViewState();
}

class _AddressesViewState extends State<AddressesView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("العناوين"),
          leading: Container(
            height: 32,
            width: 32,
            padding: EdgeInsets.only(right: 5),
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
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
        body: ListView(padding: EdgeInsets.all(16), children: [
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => _Addresses(),
            separatorBuilder: (context, index) => SizedBox(height: 20.h),
            itemCount: 4,
          ),
          // FilledButton(
          //   onPressed: () {
          //     navigateTo(AddressesView());
          //   },
          //   child: Container(
          //     child: Text("إضافة عنوان"),
          //     decoration: BoxDecoration(
          //       color: Color(0xffF9FCF5),
          //       borderRadius: BorderRadius.circular(15),
          //       border: Border.all(
          //         color: Theme.of(context).primaryColor,
          //       ),
          //     ),
          //   ),
          // ),
          ElevatedButton( onPressed:   () {
            navigateTo(AddressesView());
            }, child: Text("data"))
        ]),
      ),
    );
  }
}

class _Addresses extends StatefulWidget {
  const _Addresses({super.key});

  @override
  State<_Addresses> createState() => _AddressesState();
}

class _AddressesState extends State<_Addresses> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 2.w,
        ),
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: Row(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.only(
                top: 4.h,
                right: 16.w,
                left: 13.w,
              ),
              child: Text.rich(
                TextSpan(
                    text: "المنزل",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                    children: [
                      const TextSpan(text: "\n"),
                      TextSpan(
                        text: "العنوان : 119 طريق الملك عبدالعزيز",
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      const TextSpan(text: "\n"),
                      const TextSpan(
                        text: "الوصف",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff999797),
                        ),
                      ),
                      const TextSpan(text: "\n"),
                      const TextSpan(
                        text: "رقم الجوال",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff999797),
                        ),
                      ),
                    ]),
              ),
            ),
          ]),
          Container(
            alignment: Alignment.topLeft,
            color: Colors.blue,
            height: 10,
            width: 10,
          ),
        ]),
      ),
    );
  }
}
