// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';

import 'app_image.dart';

class AppInput extends StatefulWidget {
  final String labelText, icon;
  final TextEditingController? controller;
  final bool isPhone, isObscure, isEnabled;

  final double paddingbuttom, paddingtop;
  final FormFieldValidator? validator;
  AppInput({
    super.key,
    this.validator,
    this.isEnabled = true,
    required this.labelText,
     required this.icon,
    this.isPhone = false,
    this.paddingbuttom = 16,
    this.paddingtop = 0,
    this.isObscure = false,
    this.controller,
  });

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: widget.paddingbuttom,
        top: widget.paddingtop,
      ),
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        enabled: widget.isEnabled,
        obscureText: isObscure && widget.isObscure,
        decoration: InputDecoration(
            suffix: widget.isObscure
                ? IconButton(
                    onPressed: () {
                      isObscure = !isObscure;
                      setState(() {});
                    },
                    icon: Icon(
                        isObscure ? Icons.visibility_off : Icons.visibility),
                  )
                : null,
            labelText: widget.labelText,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child:AppImage(
                widget.icon,
                fit: BoxFit.scaleDown,
                height: 20,
                width: 18,
              ),
            ),
            icon: widget.isPhone
                ? Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          "assets/icons/saudi_flag.png",
                          width: 32,
                          height: 20,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "966+",
                          style: TextStyle(
                            fontSize: 15,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    width: 70,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      border: Border.all(color: Color(0xffF3F3F3)),
                    ),
                  )
                : null),
      ),
    );
  }
}
