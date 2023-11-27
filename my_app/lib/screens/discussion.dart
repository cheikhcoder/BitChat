// import 'package:flutter/material.dart';
// import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
// import 'package:flutter_chat_ui/flutter_chat_ui.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: ChatPage(),
//     );
//   }
// }

// class ChatPage extends StatefulWidget {
//   @override
//   State<ChatPage> createState() => _ChatPageState();
// }

// class _ChatPageState extends State<ChatPage> {
//   List<types.Message> _messages = [];
//   final _user1 = const types.User(
//     id: 'user_1',
//     firstName: 'John',
//     lastName: 'Doe',
//   );
//   final _user2 = const types.User(
//     id: 'user_2',
//     firstName: 'Jane',
//     lastName: 'Doe',
//   );

//   @override
//   void initState() {
//     super.initState();
//     _loadMessages();
//   }

//   void _addMessage(types.Message message) {
//     setState(() {
//       _messages = [..._messages, message];
//     });
//   }

//   void _handleSendPressed(types.PartialText message) {
//     final textMessage = types.TextMessage(
//       author: _user1,
//       createdAt: DateTime.now().millisecondsSinceEpoch,
//       id: 'text_message_${_messages.length + 1}',
//       text: message.text,
//     );

//     _addMessage(textMessage);
//   }

//   void _loadMessages() {
//     final user1Message = types.TextMessage(
//       author: _user1,
//       createdAt: DateTime.now().millisecondsSinceEpoch,
//       id: 'text_message_1',
//       text: 'Hello, how are you?',
//     );

//     final user2Message = types.TextMessage(
//       author: _user2,
//       createdAt: DateTime.now().millisecondsSinceEpoch + 1000,
//       id: 'text_message_2',
//       text: 'Hi John! I am doing well. How about you?',
//     );

//     setState(() {
//       _messages = [user1Message, user2Message];
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Chat(
//         messages: _messages,
//         onSendPressed: _handleSendPressed,
//         user: _user1,
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatPage(),
    );
  }
}

class ChatPage extends StatefulWidget {
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<types.Message> _messages = [];
  final _user1 = const types.User(
    id: 'user_1',
    firstName: 'John',
    lastName: 'Doe',
  );

  final _user2 = const types.User(
    id: 'user_2',
    firstName: 'Jane',
    lastName: 'Doe',
  );

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages = [..._messages, message];
    });
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user1,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: 'text_message_1',
      text: message.text,
    );

    _addMessage(textMessage);
  }

  void _loadMessages() {
    // Load initial messages here or from an API
    final initialMessage1 = types.TextMessage(
      author: _user1,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: 'text_message_1',
      text: 'je te conseille binance c\'est bon pour les debutants .',
    );

    final initialMessage2 = types.TextMessage(
      author: _user2,
      createdAt: DateTime.now().millisecondsSinceEpoch + 1000,
      id: 'text_message_2',
      text:
          'Salut je suis debutant ,  quelle plateforme de portefeuille  me conseillez vous ? .',
    );

    setState(() {
      _messages = [initialMessage1, initialMessage2];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Chat(
        messages: _messages,
        onSendPressed: _handleSendPressed,
        user: _user1,
      ),
    );
  }
}
