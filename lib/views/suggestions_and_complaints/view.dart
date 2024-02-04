// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SuggestionsAndComplaintsView extends StatelessWidget {
  const SuggestionsAndComplaintsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("الأقتراحات والشكاوي"),
                centerTitle: true,

        leading: IconButton(
          onPressed: () {},
          icon: Image.asset(
            "assets/icons/back_arrow.png",
            height: 32,
            width: 32,
            fit: BoxFit.fill,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 51, right: 17, left: 17),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  
                  labelText: "الإسم",
                  labelStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: Color(
                      0xff8B8B8B,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
