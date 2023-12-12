import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scholar_chat/model/message.dart';

import '../constant.dart';
import '../widgets/chat_buble.dart';

class ChatScreen extends StatelessWidget {
  static String id = 'chat_screen';
  CollectionReference messeges =
      FirebaseFirestore.instance.collection(kMessagesCollection);
  TextEditingController messegeController = TextEditingController();
  final _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    String email = ModalRoute.of(context)!.settings.arguments as String;
    return StreamBuilder<QuerySnapshot>(
        stream: messeges.orderBy(kCreatedAt, descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Message> messages = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messages.add(Message.fromJson(
                  snapshot.data!.docs[i].data() as Map<String, dynamic>));
            }
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: kPrimarycolor,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/scholar.png', height: 50),
                    const Text('Chat'),
                  ],
                ),
                centerTitle: true,
              ),
              body: Column(children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: _scrollController,
                    itemBuilder: (context, index) {
                      return messages[index].id == email
                          ? ChatBuble(
                              message: Message(
                                message: messages[index].message,
                                id: messages[index].id,
                              ),
                            )
                          : ChatBubleForFriend(
                              message: Message(
                                message: messages[index].message,
                                id: messages[index].id,
                              ),
                            );
                    },
                    itemCount: messages.length,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                      controller: messegeController,
                      onSubmitted: (value) {
                        messeges.add(
                          {
                            kMessage: value,
                            kCreatedAt: DateTime.now(),
                            'id': email,
                          },
                        );
                        messegeController.clear();
                        _scrollController.animateTo(
                          0,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      },
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide: const BorderSide(
                            color: kPrimarycolor,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide: const BorderSide(
                            color: kPrimarycolor,
                          ),
                        ),
                        hintText: 'Type a message',
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.send,
                            color: kPrimarycolor,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                      )),
                )
              ]),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
