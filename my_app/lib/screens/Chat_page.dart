// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../services/Chat_service.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController messageController = TextEditingController();
  List<ChatMessage> chatMessages = [];
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background_image.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: chatMessages.length,
                itemBuilder: (context, index) {
                  final message = chatMessages[index];
                  return ChatBubble(
                    text: message.text,
                    isUserMessage: message.isUserMessage,
                  );
                },
              ),
            ),
            Divider(height: 1),
            Container(
              padding: EdgeInsets.all(8),
              color: Colors.black,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      controller: messageController,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: Colors.white),
                        hintText: "Let's talk Bitcoin...",
                        hintStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onSubmitted: (value) {
                        sendMessage(value);
                        messageController.clear();
                      },
                    ),
                  ),
                  isLoading
                      ? CircularProgressIndicator()
                      : IconButton(
                          color: Colors.white,
                          icon: Icon(Icons.send),
                          onPressed: () {
                            sendMessage(messageController.text);
                            messageController.clear();
                          },
                        ),
                ],
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          "BitChat",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
    );
  }

  void sendMessage(String message) async {
    if (message.isNotEmpty) {
      setState(() {
        chatMessages.add(ChatMessage(text: message, isUserMessage: true));
        isLoading = true;
      });

      String response = await ChatService().request(message) ?? "No response";

      setState(() {
        chatMessages.add(ChatMessage(text: response, isUserMessage: false));
        isLoading = false;
      });
    }
  }
}

class ChatMessage {
  final String text;
  final bool isUserMessage;

  ChatMessage({required this.text, required this.isUserMessage});
}

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isUserMessage;

  ChatBubble({required this.text, required this.isUserMessage});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUserMessage ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isUserMessage ? Colors.blue : Colors.green,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft:
                isUserMessage ? Radius.circular(15) : Radius.circular(0),
            bottomRight:
                isUserMessage ? Radius.circular(0) : Radius.circular(15),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.white70),
        ),
      ),
    );
  }
}
