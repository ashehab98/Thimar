// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:thimar/core/logic/cache_helper.dart';
import 'package:thimar/views/home/view.dart';

import '../login/view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CacheHelper.isAuth() ? HomeView() : LoginView(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            // Transform.translate(
            //   offset: Offset(100, MediaQuery.of(context).size.height-250),
            //   child: Image.asset(
            //     "assets/images/side_image.png",
            //     height: 300,
            //     width: 450,
            //     fit: BoxFit.fill,
            //   ),
            // ),

            Positioned(
              bottom: -60,
              left: 50,
              child: Image.asset(
                "assets/images/side_image.png",
                height: 300,
                width: 450,
                fit: BoxFit.fill,
              ),
            ),
            Image.asset(
              "assets/images/splash_bg.png",
              fit: BoxFit.fill,
              height: double.infinity,
              width: double.infinity,
            ),
            Center(
              child: FadeInDownBig(
                child: Image.asset(
                  "assets/images/logo.png",
                  height: 175,
                  width: 160,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
