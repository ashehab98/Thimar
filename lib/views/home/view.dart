// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../gen/assets.gen.dart';
import 'pages/fav/view.dart';
import 'pages/main/view.dart';
import 'pages/my_account/view.dart';
import 'pages/my_orders/my_orders_now_view.dart';
import 'pages/notifications/view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  List<Widget> pages = [
    MainPage(),
    MyOrdersNowPage(),
    NotificationsPage(),
    FavPage(),
    MyAccountPage(),
  ];
  List<String> labels = [
    "الرئيسية",
    "طلباتي",
    "الإشعارات",
    "المفضلة",
    "حسابي",
  ];

  List<String> icons = [
    Assets.icons.svg.main,
    Assets.icons.svg.myOrders,
    Assets.icons.svg.notifications,
    Assets.icons.svg.fav,
    Assets.icons.svg.myAccount,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Color(0xffAED489),
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: currentIndex,
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },
        type: BottomNavigationBarType.fixed,
        items: List.generate(
          icons.length,
          (index) => BottomNavigationBarItem(
              icon: SvgPicture.asset(
                icons[index],
                color: currentIndex == index ? Colors.white : Color(0xffAED489),
              ),
              label: labels[index]),
        ),
      ),
    );
  }
}
