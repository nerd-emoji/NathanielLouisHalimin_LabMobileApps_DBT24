import '../models/contact.dart';

class DummyData {
  static List<Contact> contacts = [
    Contact(
      id: '1',
      name: 'Nazma',
      message: 'How are you?',
      time: '09:25 AM',
      avatarUrl: 'https://i.pravatar.cc/150?img=1',
      messages: [
        ChatMessage(
          text: 'Hey, how are you?',
          isSentByMe: false,
          time: '09:20 AM',
        ),
        ChatMessage(
          text: 'I\'m good, thanks! How about you?',
          isSentByMe: true,
          time: '09:22 AM',
        ),
        ChatMessage(
          text: 'How are you?',
          isSentByMe: false,
          time: '09:25 AM',
        ),
      ],
    ),
    Contact(
      id: '2',
      name: 'Adom',
      message: 'Let\'s do lunch',
      time: '08:40 AM',
      avatarUrl: 'https://i.pravatar.cc/150?img=12',
      messages: [
        ChatMessage(
          text: 'Are you free tomorrow?',
          isSentByMe: false,
          time: '08:35 AM',
        ),
        ChatMessage(
          text: 'Yes, I am! What do you have in mind?',
          isSentByMe: true,
          time: '08:38 AM',
        ),
        ChatMessage(
          text: 'Let\'s do lunch',
          isSentByMe: false,
          time: '08:40 AM',
        ),
      ],
    ),
    Contact(
      id: '3',
      name: 'Ema',
      message: 'How is your vacation?',
      time: '07:30 AM',
      avatarUrl: 'https://i.pravatar.cc/150?img=5',
      messages: [
        ChatMessage(
          text: 'How is your vacation?',
          isSentByMe: false,
          time: '07:30 AM',
        ),
        ChatMessage(
          text: 'It\'s amazing! The beach is beautiful',
          isSentByMe: true,
          time: '07:45 AM',
        ),
        ChatMessage(
          text: 'Send me some photos!',
          isSentByMe: false,
          time: '07:50 AM',
        ),
      ],
    ),
    Contact(
      id: '4',
      name: 'Rahul',
      message: 'See you at gym',
      time: 'Yesterday',
      avatarUrl: 'https://i.pravatar.cc/150?img=13',
      messages: [
        ChatMessage(
          text: 'Are you coming to the gym today?',
          isSentByMe: true,
          time: '06:00 PM',
        ),
        ChatMessage(
          text: 'Yes, I\'ll be there at 7',
          isSentByMe: false,
          time: '06:15 PM',
        ),
        ChatMessage(
          text: 'See you at gym',
          isSentByMe: false,
          time: '06:30 PM',
        ),
      ],
    ),
    Contact(
      id: '5',
      name: 'Adom',
      message: 'Send the document',
      time: 'Yesterday',
      avatarUrl: 'https://i.pravatar.cc/150?img=8',
      messages: [
        ChatMessage(
          text: 'Do you have the project document?',
          isSentByMe: false,
          time: '03:00 PM',
        ),
        ChatMessage(
          text: 'Yes, let me find it',
          isSentByMe: true,
          time: '03:05 PM',
        ),
        ChatMessage(
          text: 'Send the document',
          isSentByMe: false,
          time: '03:10 PM',
        ),
      ],
    ),
    Contact(
      id: '6',
      name: 'Esra',
      message: 'Good Morning',
      time: 'Yesterday',
      avatarUrl: 'https://i.pravatar.cc/150?img=9',
      messages: [
        ChatMessage(
          text: 'Good Morning',
          isSentByMe: false,
          time: '08:00 AM',
        ),
        ChatMessage(
          text: 'Good morning! How are you today?',
          isSentByMe: true,
          time: '08:15 AM',
        ),
        ChatMessage(
          text: 'I\'m great, ready for the day!',
          isSentByMe: false,
          time: '08:20 AM',
        ),
      ],
    ),
    Contact(
      id: '7',
      name: 'Sahena',
      message: 'Thank you',
      time: 'Monday',
      avatarUrl: 'https://i.pravatar.cc/150?img=10',
      messages: [
        ChatMessage(
          text: 'I really appreciate your help yesterday',
          isSentByMe: false,
          time: '11:00 AM',
        ),
        ChatMessage(
          text: 'No problem at all! Happy to help',
          isSentByMe: true,
          time: '11:10 AM',
        ),
        ChatMessage(
          text: 'Thank you',
          isSentByMe: false,
          time: '11:15 AM',
        ),
      ],
    ),
  ];
}
