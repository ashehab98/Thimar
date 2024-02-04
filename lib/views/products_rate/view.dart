// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:thimar/gen/assets.gen.dart';

class ProductRateView extends StatefulWidget {
  const ProductRateView({super.key});

  @override
  State<ProductRateView> createState() => _ProductRateViewState();
}

class _ProductRateViewState extends State<ProductRateView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                centerTitle: true,

        title: Padding(
          padding: const EdgeInsets.only(right: 73),
          child: Text(
            "تقييم المنتجات",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset(
            Assets.icons.backArrow.path,
            height: 32,
            width: 32,
            fit: BoxFit.fill,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(
            right: 16,
            left: 16,
            bottom: 26,
          ),
          children: <Widget>[
            SizedBox(
              height: 41,
            ),
            Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Image.asset(
                          Assets.images.potato.path,
                          width: 75,
                          height: 64,
                          fit: BoxFit.fill,
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              "طماطم",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            Text(
                              "السعر / 1كجم",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Color(0xff808080),
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  "45",
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
                                  "56 رس",
                                  style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 13,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),

                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.star, color: Color(0xffFF9529)),
                        Icon(Icons.star, color: Color(0xffFF9529)),
                        Icon(Icons.star, color: Color(0xffFF9529)),
                        Icon(Icons.star, color: Color(0xffFF9529)),
                        Icon(Icons.star, color: Color(0xffFF9529)),
                      ],
                    ),
                    SizedBox(height: 13.2,),
                    SizedBox(
                      height: 89,width: 325,
                      child: TextFormField(
                        
                        decoration: InputDecoration(
                          labelText: "تعليق المنتج",
                          labelStyle: TextStyle(
                            color: Color(0xff9C9C9C),
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
