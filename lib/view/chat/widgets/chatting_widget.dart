// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:nanny_fairy/Repository/family_chat_repository.dart';

import '../../../res/components/colors.dart';

class ChatScreenWidget extends StatefulWidget {
  const ChatScreenWidget({super.key});

  @override
  State createState() => ChatScreenState();
}

class ChatMessage {
  final String text;
  final bool isSender;

  ChatMessage({required this.text, required this.isSender});
}

class ChatScreenState extends State<ChatScreenWidget> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = TextEditingController();

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = ChatMessage(
        text: text,
        isSender: true); // You can modify this to determine sender/receiver.
    setState(() {
      _messages.insert(0, message);
    });
  }

  Widget _buildMessage(ChatMessage message) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      child: Container(
        alignment:
            message.isSender ? Alignment.centerRight : Alignment.centerLeft,
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color:
                message.isSender ? AppColor.primaryColor : AppColor.blackColor,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Text(
            message.text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemCount: _messages.length,
            itemBuilder: (context, index) {
              return _buildMessage(_messages[index]);
            },
          ),
        ),
        const Divider(height: 1.0),
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: _buildTextComposer(),
        ),
      ],
    );
  }

  Widget _buildTextComposer() {
    FamilyChatRepository familyChatRepository = FamilyChatRepository();

    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
              decoration: const InputDecoration(
                  hintText: 'Type a message...',
                  hintStyle: TextStyle(
                    color: AppColor.blackColor,
                  )),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.send,
              color: AppColor.primaryColor,
            ),
            onPressed: () {
              if (_textController.text.isNotEmpty) {
                // _handleSubmitted(_textController.text);
                familyChatRepository.saveDataToContactsSubcollection(
                  _textController.text,
                  DateTime.now(),
                  "2u8XmJMNAoboOmY0RhbJFvmXw9Z2",
                  "Basit Ali",
                  "Hasian",
                  "https://firebasestorage.googleapis.com/v0/b/nanny-fairy.appspot.com/o/Profile%2F38545360-53f8-11ef-8244-ff8013a36bbf?alt=media&token=a353846a-ac77-4e72-9363-28a82ed4f378",
                  "https://firebasestorage.googleapis.com/v0/b/nanny-fairy.appspot.com/o/Profile%2F5ce11bf0-570e-11ef-9d6c-ad5999710623?alt=media&token=cb8153d4-0e45-48ef-9b95-c1f283911f07",
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
