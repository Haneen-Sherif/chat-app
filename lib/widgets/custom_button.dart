import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({this.onTab, required this.text});

  VoidCallback? onTab;
  String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        child: Center(child: Text(text)),
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
