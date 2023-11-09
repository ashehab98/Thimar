
import 'package:flutter/material.dart';
import 'package:thimar/views/home/pages/my_orders/my_orders_finished_view.dart';
import 'package:thimar/views/home/pages/my_orders/my_orders_now_view.dart';

class MyOrdersView extends StatefulWidget {
  const MyOrdersView({super.key});

  @override
  State<MyOrdersView> createState() => _MyOrdersViewState();
}

class _MyOrdersViewState extends State<MyOrdersView> {
  int currentIndex = 0;
  List<Widget> pages = [
    MyOrdersNowPage(),
    MyOrdersFinishedPage(),
  ];
  List<String> labels = [
    "الحاليه",
    "المنتهية",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

       body: pages[currentIndex],
    );
  }
}
