import 'package:flutter/material.dart';

final formKey = GlobalKey<FormState>();

class AppButton extends StatefulWidget {
  final bool isLoading;
  final String text;
  final VoidCallback onPress;
  final Color? bgColor;
  const AppButton({
    this.isLoading =false,
    this.bgColor,
    super.key,
    required this.text,
    required this.onPress,
  });

  @override
  @override
  State<AppButton> createState() => _AppBottomState();
}

class _AppBottomState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    // if(isLoading)){
      
    //   return Center(
    //     child: CircularProgressIndicator(),
    //   );
  
    // }
    return FilledButton(
      onPressed: () {
        widget.onPress;
      },
      child: Container(
        height: 30,
        child: Text(
          widget.text,
          style:  TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
