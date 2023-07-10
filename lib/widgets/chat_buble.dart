import 'package:flutter/material.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/models/message.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({super.key, required this.message});

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 24, bottom: 16, top: 16),
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(32),
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
            color: kPrimaryColor),
        child: Text(message.message, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

class ChatBubleForFriend extends StatelessWidget {
  const ChatBubleForFriend({super.key, required this.message});

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 24, bottom: 16, top: 16),
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(32),
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
            color: kSecondaryColor),
        child: Text(message.message, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
