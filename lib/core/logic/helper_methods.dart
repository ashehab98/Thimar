import 'package:flutter/material.dart';

final navigateKey = GlobalKey<NavigatorState>();
void navigateTo(Widget page) => Navigator.push(
    navigateKey.currentContext!,
    MaterialPageRoute(
      builder: (context) => page,
    ));

enum messageType { success, fail, warning }

void showmessage(String message, {messageType type = messageType.fail}) {
  if (message.isNotEmpty) {
    ScaffoldMessenger.of(navigateKey.currentContext!).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(
            color: type == messageType.warning ? Colors.black : Colors.white,
          ),
        ),
        backgroundColor: type == messageType.fail
            ? Colors.red
            : type == messageType.warning
                ? Colors.yellow
                : Colors.green,
        behavior: SnackBarBehavior.fixed,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
  print(message);
}
