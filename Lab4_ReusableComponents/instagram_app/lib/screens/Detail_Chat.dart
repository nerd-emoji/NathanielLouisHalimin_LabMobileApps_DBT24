import 'package:flutter/material.dart';
import 'Chat.dart';

class DetailChatPage extends StatefulWidget {
  final Chat chat;

  const DetailChatPage({Key? key, required this.chat}) : super(key: key);

  @override
  State<DetailChatPage> createState() => _DetailChatPageState();
}

class Message {
  final String content;
  final bool isFromMe;
  final String timestamp;

  Message({
    required this.content,
    required this.isFromMe,
    required this.timestamp,
  });
}

class _DetailChatPageState extends State<DetailChatPage> {
  final TextEditingController _messageController = TextEditingController();
  
  final List<Message> messages = [
    Message(
      content: 'Hey! How are you?',
      isFromMe: false,
      timestamp: '2:15 PM',
    ),
    Message(
      content: 'I\'m doing great! How about you?',
      isFromMe: true,
      timestamp: '2:16 PM',
    ),
    Message(
      content: 'Pretty good! Did you finish that project?',
      isFromMe: false,
      timestamp: '2:18 PM',
    ),
    Message(
      content: 'Yeah, just wrapped it up',
      isFromMe: true,
      timestamp: '2:19 PM',
    ),
    Message(
      content: 'Nice! Want to grab coffee later?',
      isFromMe: false,
      timestamp: '2:21 PM',
    ),
    Message(
      content: 'Sounds good! Let\'s do it',
      isFromMe: true,
      timestamp: '2:22 PM',
    ),
  ];

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      appBar: AppBar(
        backgroundColor: const Color(0xFF000000),
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey.shade800,
              child: Icon(
                Icons.person,
                size: 24,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.chat.displayName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.chat.isOnline ? 'Active now' : 'Active 2h ago',
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.call_outlined, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.videocam_outlined, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.info_outlined, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Messages List
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[messages.length - 1 - index];
                return MessageBubble(message: message);
              },
            ),
          ),
          
          // Message Input Area
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.grey.shade900),
              ),
            ),
            child: Row(
              children: [
                // Emoji/Sticker Button
                IconButton(
                  icon: const Icon(Icons.add_circle_outline, color: Colors.blue),
                  onPressed: () {},
                  iconSize: 28,
                ),
                
                // Text Input
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Aa',
                      hintStyle: TextStyle(color: Colors.grey.shade600),
                      filled: true,
                      fillColor: const Color(0xFF1A1A1A),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                    minLines: 1,
                    maxLines: 4,
                  ),
                ),
                
                const SizedBox(width: 8),
                
                // Send Button
                IconButton(
                  icon: const Icon(Icons.favorite_outline, color: Colors.white),
                  onPressed: () {
                    if (_messageController.text.isNotEmpty) {
                      // Add message logic here
                      _messageController.clear();
                    }
                  },
                  iconSize: 24,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final Message message;

  const MessageBubble({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: message.isFromMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: message.isFromMe
                    ? const Color(0xFF0095F6)
                    : const Color(0xFF262626),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: message.isFromMe
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  Text(
                    message.content,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    message.timestamp,
                    style: TextStyle(
                      color: message.isFromMe
                          ? Colors.white.withOpacity(0.7)
                          : Colors.grey.shade600,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
