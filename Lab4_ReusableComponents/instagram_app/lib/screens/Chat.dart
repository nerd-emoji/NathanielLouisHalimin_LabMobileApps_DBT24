import 'package:flutter/material.dart';
import 'Detail_Chat.dart';
import 'HomePage.dart';

class InstagramChatApp extends StatelessWidget {
  const InstagramChatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Chat',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF000000),
        primaryColor: const Color(0xFF000000),
      ),
      home: const InstagramChatPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class InstagramChatPage extends StatefulWidget {
  const InstagramChatPage({Key? key}) : super(key: key);

  @override
  State<InstagramChatPage> createState() => _InstagramChatPageState();
}

class Chat {
  final String username;
  final String displayName;
  final String lastMessage;
  final String timeAgo;
  final bool isOnline;
  final int unreadCount;

  Chat({
    required this.username,
    required this.displayName,
    required this.lastMessage,
    required this.timeAgo,
    this.isOnline = false,
    this.unreadCount = 0,
  });
}

class _InstagramChatPageState extends State<InstagramChatPage> {
  int _selectedIndex = 2;

  final List<Chat> chats = [
    Chat(
      username: 'jaded.elephant17',
      displayName: 'jaded.elephant17',
      lastMessage: 'OK',
      timeAgo: '2m',
      isOnline: true,
      unreadCount: 1,
    ),
    Chat(
      username: 'kyia_kayaks',
      displayName: 'kyia_kayaks',
      lastMessage: 'Did you leave yet?',
      timeAgo: '2m',
      isOnline: true,
      unreadCount: 0,
    ),
    Chat(
      username: 'ted_graham321',
      displayName: 'ted_graham321',
      lastMessage: 'Sounds good! Let\'s do it',
      timeAgo: '45m',
      isOnline: false,
      unreadCount: 0,
    ),
    Chat(
      username: 'pia.in.a.pod',
      displayName: 'Study Group',
      lastMessage: 'pia.in.a.pod: hahaha',
      timeAgo: '2h',
      isOnline: false,
      unreadCount: 0,
    ),
    Chat(
      username: 'heaven.is.nevaeh',
      displayName: 'heaven.is.nevaeh',
      lastMessage: 'It was great!',
      timeAgo: '3h',
      isOnline: false,
      unreadCount: 0,
    ),
    Chat(
      username: 'lil_wyatt838',
      displayName: 'lil_wyatt838',
      lastMessage: 'that\'s awesome!',
      timeAgo: '3d',
      isOnline: false,
      unreadCount: 0,
    ),
    Chat(
      username: 'paisley.print.48',
      displayName: 'paisley.print.48',
      lastMessage: 'Whaaaat??',
      timeAgo: '8h',
      isOnline: false,
      unreadCount: 0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      appBar: AppBar(
        backgroundColor: const Color(0xFF000000),
        elevation: 0,
        title: Row(
          children: [
            const Text(
              'okay_kaiden_459',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 4),
            const Icon(Icons.arrow_drop_down, color: Colors.white, size: 20),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.videocam_outlined, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey.shade600),
                filled: true,
                fillColor: const Color(0xFF1A1A1A),
                prefixIcon: Icon(Icons.search, color: Colors.grey.shade600),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
          
          // Messages/Requests Tabs
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                const Text(
                  'Messages',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 24),
                Text(
                  'Requests',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 12),
          
          // Chat List
          Expanded(
            child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                return ChatCard(
                  chat: chats[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailChatPage(chat: chats[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF000000),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const InstagramHomePage(),
              ),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 28),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_collection_outlined, size: 28),
            label: 'Reels',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message, size: 28),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 28),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined, size: 28),
            label: 'Profile',
          ),
        ],
      ),    );
  }
}

class ChatCard extends StatelessWidget {
  final Chat chat;
  final VoidCallback onTap;

  const ChatCard({
    Key? key,
    required this.chat,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Row(
          children: [
            // Profile Picture with Online Indicator
            Stack(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.grey.shade800,
                  child: Icon(
                    Icons.person,
                    size: 32,
                    color: Colors.grey.shade600,
                  ),
                ),
                if (chat.isOnline)
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        color: const Color(0xFF31A24C),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFF000000),
                          width: 2,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            
            const SizedBox(width: 12),
            
            // Chat Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chat.displayName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    chat.lastMessage,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(width: 12),
            
            // Time and Message Icon
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  chat.timeAgo,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 8),
                Icon(
                  Icons.photo_camera_outlined,
                  color: Colors.grey.shade600,
                  size: 18,
                ),
              ],
            ),
            
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
