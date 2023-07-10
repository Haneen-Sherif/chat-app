import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {this.onChanged,
      this.keyboardType = TextInputType.text,
      required this.hintText,
      this.obscureText = false,
      this.textInputAction = TextInputAction.next,
      required this.suffixIcon});

  Function(String)? onChanged;
  String hintText;
  var keyboardType;
  bool obscureText;
  TextInputAction textInputAction;
  Widget suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      style: TextStyle(
        color: Colors.white,
      ),
      obscureText: obscureText,
      validator: (value) {
        if (value!.isEmpty) {
          return "Field is required";
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white),
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white))),
    );
  }
}
