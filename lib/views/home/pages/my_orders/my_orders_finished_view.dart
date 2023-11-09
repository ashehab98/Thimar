// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:thimar/core/design/app_image.dart';
import 'package:thimar/core/logic/helper_methods.dart';
import 'package:thimar/gen/assets.gen.dart';
import 'package:thimar/views/home/pages/my_orders/my_orders_now_view.dart';

class MyOrdersFinishedPage extends StatefulWidget {
  const MyOrdersFinishedPage({super.key});

  @override
  State<MyOrdersFinishedPage> createState() => _MyOrderspageState();
}

class _MyOrderspageState extends State<MyOrdersFinishedPage> {
  @override
  void initState() {
    super.initState();
    MyOrdersNowPage();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Center(
            child: Text(
              "طلباتي",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 20, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffF3F3F3)),
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                        color: Colors.white),
                    height: 55,
                    width: 350,
                    child: Row(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: 165,
                          height: 42,
                          child: FilledButton(
                            style: FilledButton.styleFrom(
                              backgroundColor: Colors.white,
                            ),
                            onPressed: () {
                              navigateTo(MyOrdersNowPage());
                            },
                            child: Text(
                              "الحاليه",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffA2A1A4),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 4.5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: 165,
                          height: 42,
                          child: FilledButton(
                            onPressed: () {},
                            child: Text(
                              "المنتهية",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 23,
                  ),
                ],
              ),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => _Item(),
              itemCount: 4,
              padding: EdgeInsets.only(
                right: 16,
                left: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.02),
                offset: Offset(0, 6),
                blurRadius: 17,
                blurStyle: BlurStyle.outer,
              ),
            ],
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Color(0xff707070).withOpacity(.1))),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 9, top: 5, right: 10, bottom: 13.5),
          child: Container(
            height: 108.5,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "طلب #4587",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                      ),
                      Text(
                        "2021,يونيو,27,",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff9C9C9C),
                        ),
                      ),
                      Divider(),
                      SizedBox(
                        height: 14.5,
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            ...List.generate(
                              3,
                              (index) => Container(
                                margin: EdgeInsetsDirectional.only(end: 3),
                                height: 25,
                                width: 25,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.blue,
                                  border: Border.all(
                                    color: Colors.red,
                                  ),
                                ),
                                child: AppImage(Assets.icons.svg.cartShopping),
                              ),
                            ),
                            Container(
                              height: 25,
                              width: 25,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Color(0xffEDF5E6),
                              ),
                              child: Center(
                                child: Text(
                                  "+2",
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 11, vertical: 5),
                      decoration: BoxDecoration(
                        color: Color(0xffEDF5E6),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Center(
                        child: Text(
                          "بإنتظار الموافقة",
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ),
                    // Spacer(),
                    Text(
                      "180ر.س",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
