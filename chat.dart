import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Chat'),
      ),
      body: Stack(
        children: <Widget>[
          // Background Image
          Image.asset(
            'assets/images/dita2.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          ListView.builder(
            itemCount: chatList.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(chatList[index].profileImage),
                ),
                title: Text(chatList[index].name),
                subtitle: Text(chatList[index].lastMessage),
                trailing: Text(chatList[index].time),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatDetail(chat: chatList[index]),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class Chat {
  final String name;
  final String lastMessage;
  final String time;
  final String profileImage;
  Chat(this.name, this.lastMessage, this.time, this.profileImage);
}

final List<Chat> chatList = [
  Chat('John Doe', 'Hai, apa kabar?', '10:00', 'assets/images/user2.jpg'),
  Chat('Jane Smith', 'Sampai bertemu!', '11:30', 'assets/images/user.jpg'),
  Chat('Peter Jones', 'Oke, terima kasih.', '12:45', 'assets/images/user3.jpg'),
];

class ChatDetail extends StatefulWidget {
  final Chat chat;

  const ChatDetail({Key? key, required this.chat}) : super(key: key);

  @override
  _ChatDetailState createState() => _ChatDetailState();
}

class _ChatDetailState extends State<ChatDetail> {
  final TextEditingController _messageController = TextEditingController();
  List<ChatMessage> _messages = [];

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        _messages.add(ChatMessage(
          message: _messageController.text,
          isMe: true,
        ));
        _messageController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(widget.chat.name),
      ),
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/images/dita2.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    return ChatMessage(
                      message: _messages[index].message,
                      isMe: _messages[index].isMe,
                    );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        decoration: InputDecoration(
                          hintText: 'Ketik pesan...',
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send),
                      onPressed: _sendMessage,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String message;
  final bool isMe;

  const ChatMessage({Key? key, required this.message, required this.isMe})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      child: Align(
        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: isMe ? Colors.blue[200] : const Color.fromARGB(255, 236, 18, 18),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(message),
        ),
      ),
    );
  }
}
