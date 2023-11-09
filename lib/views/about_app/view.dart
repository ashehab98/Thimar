// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/features/cart/model.dart';
import 'package:thimar/views/about_app/cubit.dart';
import 'package:thimar/views/about_app/states.dart';

class AboutAppView extends StatefulWidget {
  const AboutAppView({super.key});

  @override
  State<AboutAppView> createState() => _AboutAppViewState();
}

class _AboutAppViewState extends State<AboutAppView> {
  @override
  void initState() {
    super.initState();
   }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "عن التطبيق",
        ),
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
      body: BlocProvider(
        create: (context) => AboutAppCubit()..getData(),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 26.5,
            ),
            Center(
              child: Image.asset(
                "assets/images/logo.png",
                height: 160,
                width: 160,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 25.5),
            Padding(
              padding: const EdgeInsets.only(right: 13, bottom: 13, left: 13),
              child: Container(
                child: BlocBuilder<AboutAppCubit, AboutAppStates>(
                  builder: (context, state) {
                    if (state is AboutAppLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is AboutAppSuccessState) {
                      return Column(
                        children: [
                          Text(
                            state.data,
                             style: TextStyle(
                              color: Color(0xff828282),
                              fontWeight: FontWeight.w300,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      );
                    } else {
                      return const Text("Data Failed");
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
