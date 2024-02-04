import 'package:flutter/material.dart';
import 'package:thimar/core/logic/cache_helper.dart';

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  int count = CacheHelper.getCount();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {
                count++;
                CacheHelper.setCount(count);
                setState(() {});
              },
              child: const Icon(Icons.add),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                count.toString(),
                style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                if (count > 0) {
                  count--;
                  CacheHelper.setCount(count);
                  setState(() {});
                }
              },
              child: const Icon(Icons.remove),
            ),
            const SizedBox(width: 30),
            FloatingActionButton(
              onPressed: () {
                count = 0;
                setState(() {});
              },
              child: const Text("clear"),
            ),
          ],
        ),
      ),
    );
  }
}
