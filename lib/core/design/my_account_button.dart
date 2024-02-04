import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/design/app_image.dart';

import '../../gen/assets.gen.dart';

class MyAccountButton extends StatefulWidget {
  final String text, image;
  // final VoidCallback onPress;

  const MyAccountButton({
    super.key,
    required this.text,
    required this.image,
    // required this.onPress,
  });

  @override
  State<MyAccountButton> createState() => _MyAccountButtonState();
}

class _MyAccountButtonState extends State<MyAccountButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(children: [
          AppImage(
            widget.image,
            height: 18.h,
            width: 18.w,
          ),
          SizedBox(width: 7.w),
          Text(
            widget.text,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ]),
        AppImage(
          Assets.icons.svg.arrowRight,
          width: 18.w,
          height: 18.w,
        ),
      ]),
    );
  }
}
