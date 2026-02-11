class Contact {
  final String id;
  final String name;
  final String message;
  final String time;
  final String avatarUrl;
  final List<ChatMessage> messages;

  Contact({
    required this.id,
    required this.name,
    required this.message,
    required this.time,
    required this.avatarUrl,
    required this.messages,
  });
}

class ChatMessage {
  final String text;
  final bool isSentByMe;
  final String time;

  ChatMessage({
    required this.text,
    required this.isSentByMe,
    required this.time,
  });
}
