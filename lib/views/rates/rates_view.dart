import 'package:flutter/material.dart';


class RatesView extends StatelessWidget {
  RatesView({
    super.key,
     required this.clientName,
    required this.clientImage,
    required this.value,
    required this.comment,
  });
   late String clientName;
  late String clientImage;
  late double value;
  late String comment;

  @override
  Widget build(BuildContext context) {
return Text(clientName);
       // return   Container(
       //      width: 270.w,
       //      height: 90.h,
       //      decoration: BoxDecoration(
       //        borderRadius: BorderRadius.circular(18),
       //      ),
       //      child: Padding(
       //        padding: const EdgeInsets.only(right: 10),
       //        child: Row(children: [
       //          Column(children: [
       //            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
       //              Text(
       //                clientName,
       //                style: const TextStyle(
       //                  color: Color(0xff333333),
       //                  fontWeight: FontWeight.bold,
       //                  fontSize: 16,
       //                ),
       //              ),
       //              SizedBox(width: 7.w),
       //              Padding(
       //                padding: const EdgeInsets.only(top: 5),
       //                child: RatingBar.builder(
       //                  initialRating: value,
       //                  ignoreGestures: true,
       //                  itemBuilder: (context, index) => const Icon(
       //                    Icons.star,
       //                    color: Colors.amber,
       //                  ),
       //                  itemCount: 5,
       //                  itemSize: 15.0,
       //                  direction: Axis.horizontal,
       //                  onRatingUpdate: (double value) {},
       //                ),
       //              ),
       //            ]),
       //            Text(
       //              comment,
       //              style:
       //                  const TextStyle(fontSize: 12, color: Color(0xff333333)),
       //            ),
       //          ]),
       //          Padding(
       //            padding: const EdgeInsets.only(right: 60),
       //            child: AppImage(
       //              clientImage,
       //              width: 55.w,
       //              height: 55.h,
       //            ),
       //          ),
       //        ]),
       //      ),
       //    );



  }
}
