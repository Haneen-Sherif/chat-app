import 'package:flutter/material.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/models/message.dart';
import 'package:untitled/widgets/chat_buble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatelessWidget {
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollection);
  static String id = "ChatPage";
  String? messageTxt;
  TextEditingController controller = TextEditingController();
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kCreatedAt, descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> messageList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messageList.add(Message.fromJson(snapshot.data!.docs[i]));
          }
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: kPrimaryColor,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(kLogo, height: 50),
                  Text("Chat"),
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: _controller,
                    itemCount: messageList.length,
                    itemBuilder: (context, index) {
                      return messageList[index].id == email
                          ? ChatBuble(
                              message: messageList[index],
                            )
                          : ChatBubleForFriend(message: messageList[index]);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: controller,
                    onChanged: (value) {
                      messageTxt = value;
                    },
                    onSubmitted: (value) {
                      submitMessage(value, email);
                    },
                    decoration: InputDecoration(
                        hintText: "Send Message",
                        suffixIcon: GestureDetector(
                          onTap: () {
                            submitMessage(messageTxt!, email);
                          },
                          child: Icon(
                            Icons.send,
                            color: kPrimaryColor,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: kPrimaryColor)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: kPrimaryColor))),
                  ),
                )
              ],
            ),
          );
        } else {
          return Text("Loading...");
        }
      },
    );
  }

  void submitMessage(String value, Object? email) {
    messages.add({kMessage: value, kCreatedAt: DateTime.now(), "id": email});
    controller.clear();
    _controller.animateTo(
      0,
      duration: Duration(microseconds: 500),
      curve: Curves.easeIn,
    );
  }
}
