import 'package:flutter/material.dart';

class AppTextButton extends StatefulWidget {
  final String text;
  final VoidCallback onPress;

  const AppTextButton({super.key, required this.text, required this.onPress});

  @override
  State<AppTextButton> createState() => _AppTextButtonState();
}

class _AppTextButtonState extends State<AppTextButton> {
  @override
  Widget build(BuildContext context) {
    return AppTextButton(
      onPress: () {
        widget.onPress;
      },
      text: widget.text,
    );
  }
}
