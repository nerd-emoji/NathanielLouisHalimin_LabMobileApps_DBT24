import 'package:flutter/material.dart';
import 'Chat.dart';

class InstagramHomeApp extends StatelessWidget {
  const InstagramHomeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF000000),
        primaryColor: const Color(0xFF000000),
      ),
      home: const InstagramHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class InstagramHomePage extends StatefulWidget {
  const InstagramHomePage({Key? key}) : super(key: key);

  @override
  State<InstagramHomePage> createState() => _InstagramHomePageState();
}

class _InstagramHomePageState extends State<InstagramHomePage> {
  int _selectedIndex = 0;

  final List<Story> stories = [
    Story(username: 'Your story', isYourStory: true, hasStory: false),
    Story(username: 'jaded.ele...', hasStory: true),
    Story(username: 'pia.in.a.pod', hasStory: true),
    Story(username: 'lil_wyatt838', hasStory: true),
    Story(username: 'freddie.m', hasStory: true),
    Story(username: 'sarah_designs', hasStory: true),
    Story(username: 'mike.photo', hasStory: true),
    Story(username: 'jane_art', hasStory: true),
  ];

  final List<Post> posts = [
    Post(
      username: 'heaven.is.nevaeh',
      caption: 'Your favorite duo 💕',
      likes: 'kyla_kayaks and others',
      timeAgo: '2 hours ago',
      hasMultipleImages: true,
    ),
    Post(
      username: 'travel.explorer',
      caption: 'Paradise found 🌴✨',
      likes: 'john_doe and others',
      timeAgo: '5 hours ago',
      hasMultipleImages: false,
    ),
    Post(
      username: 'food.lover',
      caption: 'Best brunch in town! 🥞☕',
      likes: 'chef_mike and others',
      timeAgo: '8 hours ago',
      hasMultipleImages: true,
    ),
    Post(
      username: 'fitness.journey',
      caption: 'Morning workout complete! 💪',
      likes: 'gym_buddy and others',
      timeAgo: '12 hours ago',
      hasMultipleImages: false,
    ),
    Post(
      username: 'art.daily',
      caption: 'New piece finished 🎨',
      likes: 'artist_collective and others',
      timeAgo: '1 day ago',
      hasMultipleImages: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      appBar: AppBar(
        backgroundColor: const Color(0xFF000000),
        elevation: 0,
        title: Image.asset(
          'assets/instagram_logo.png',
          height: 35,
          errorBuilder: (context, error, stackTrace) {
            return const Text(
              'Instagram',
              style: TextStyle(
                fontFamily: 'Billabong',
                fontSize: 32,
                color: Colors.white,
              ),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.chat_bubble_outline, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          // Stories Section
          SliverToBoxAdapter(
            child: Container(
              height: 110,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey.shade900, width: 0.5),
                ),
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                itemCount: stories.length,
                itemBuilder: (context, index) {
                  return StoryItem(story: stories[index]);
                },
              ),
            ),
          ),
          
          // Posts Section
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return PostItem(post: posts[index]);
              },
              childCount: posts.length,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
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
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const InstagramChatPage(),
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
      ),
    );
  }
}

class Story {
  final String username;
  final bool hasStory;
  final bool isYourStory;

  Story({
    required this.username,
    this.hasStory = true,
    this.isYourStory = false,
  });
}

class StoryItem extends StatelessWidget {
  final Story story;

  const StoryItem({Key? key, required this.story}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        children: [
          Container(
            width: 70,
            height: 68,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: story.hasStory && !story.isYourStory
                  ? const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xFFFD1D1D),
                        Color(0xFFE1306C),
                        Color(0xFFC13584),
                        Color(0xFF833AB4),
                      ],
                    )
                  : null,
              border: !story.hasStory
                  ? Border.all(color: Colors.grey.shade800, width: 2)
                  : null,
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.5),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF000000),
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2.5),
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.grey.shade800,
                        child: Icon(
                          Icons.person,
                          size: 35,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      if (story.isYourStory)
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: const Color(0xFF0095F6),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xFF000000),
                                width: 2,
                              ),
                            ),
                            child: const Icon(
                              Icons.add,
                              size: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          SizedBox(
            width: 70,
            child: Text(
              story.username,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Post {
  final String username;
  final String caption;
  final String likes;
  final String timeAgo;
  final bool hasMultipleImages;

  Post({
    required this.username,
    required this.caption,
    required this.likes,
    required this.timeAgo,
    this.hasMultipleImages = false,
  });
}

class PostItem extends StatefulWidget {
  final Post post;

  const PostItem({Key? key, required this.post}) : super(key: key);

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final int _totalPages = 3;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Post Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            children: [
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xFFFD1D1D),
                      Color(0xFFE1306C),
                      Color(0xFFC13584),
                      Color(0xFF833AB4),
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF000000),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.grey.shade800,
                        child: Icon(
                          Icons.person,
                          size: 18,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                widget.post.username,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.more_vert, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
        ),

        // Post Image Carousel
        Stack(
          children: [
            SizedBox(
              height: 280,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: widget.post.hasMultipleImages ? _totalPages : 1,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.grey.shade900,
                    child: Center(
                      child: Icon(
                        Icons.image,
                        size: 100,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  );
                },
              ),
            ),
            
            // Carousel Indicators
            if (widget.post.hasMultipleImages)
              Positioned(
                top: 250,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _totalPages,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentPage == index
                            ? const Color(0xFF0095F6)
                            : Colors.grey.shade600,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),

        // Post Actions
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.favorite_border, size: 28),
                color: Colors.white,
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.chat_bubble_outline, size: 26),
                color: Colors.white,
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.send, size: 26),
                color: Colors.white,
                onPressed: () {},
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.bookmark_border, size: 28),
                color: Colors.white,
                onPressed: () {},
              ),
            ],
          ),
        ),

        // Likes
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Stack(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 1),
                      color: Colors.grey.shade700,
                    ),
                  ),
                  Positioned(
                    left: 12,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 1),
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 24,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 1),
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10),
              Text(
                'Liked by ${widget.post.likes}',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),

        // Caption
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 14, color: Colors.white),
              children: [
                TextSpan(
                  text: widget.post.username,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const TextSpan(text: ' '),
                TextSpan(text: widget.post.caption),
              ],
            ),
          ),
        ),

        // Time
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Text(
            widget.post.timeAgo.toUpperCase(),
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey.shade600,
            ),
          ),
        ),

        const SizedBox(height: 10),
      ],
    );
  }
}