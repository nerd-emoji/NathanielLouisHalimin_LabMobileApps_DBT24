import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'profile.dart';

class Library extends StatefulWidget {
  const Library({super.key});

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  // Sample borrowed books data - replace with actual data from database
  final List<Map<String, String>> borrowedBooks = [
    {
      'title': 'To Kill a Mockingbird',
      'author': 'Harper Lee',
      'borrowDate': '2024-01-15',
      'dueDate': '2024-02-15',
      'isbn': '978-0-06-112008-4',
    },
    {
      'title': 'The Great Gatsby',
      'author': 'F. Scott Fitzgerald',
      'borrowDate': '2024-01-20',
      'dueDate': '2024-02-20',
      'isbn': '978-0-7432-7356-5',
    },
    {
      'title': '1984',
      'author': 'George Orwell',
      'borrowDate': '2024-01-25',
      'dueDate': '2024-02-25',
      'isbn': '978-0-452-28423-4',
    },
    {
      'title': 'Pride and Prejudice',
      'author': 'Jane Austen',
      'borrowDate': '2024-01-28',
      'dueDate': '2024-02-28',
      'isbn': '978-0-14-143951-8',
    },
    {
      'title': 'The Catcher in the Rye',
      'author': 'J.D. Salinger',
      'borrowDate': '2024-02-01',
      'dueDate': '2024-03-01',
      'isbn': '978-0-316-76948-0',
    },
  ];

  bool _isOverdue(String dueDate) {
    final due = DateTime.parse(dueDate);
    final now = DateTime.now();
    return now.isAfter(due);
  }

  int _daysRemaining(String dueDate) {
    final due = DateTime.parse(dueDate);
    final now = DateTime.now();
    return due.difference(now).inDays;
  }

  void _showBottomMenu() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: const BoxDecoration(
            color: Color(0xFF424242), // Dark grey
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildMenuButton('Dashboard'),
              _buildMenuButton('Library'),
              _buildMenuButton('Profile'),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMenuButton(String title) {
    return ListTile(
      leading: const Icon(Icons.circle, size: 8, color: Colors.white),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      onTap: () {
        Navigator.pop(context);
        _navigateToPage(title);
      },
    );
  }

  void _navigateToPage(String title) {
    Widget page;

    switch (title) {
      case 'Dashboard':
        page = const Dashboard();
        break;
      case 'Library':
        return;
      case 'Profile':
        page = const Profile();
        break;
      default:
        return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  Widget _buildBookCard(Map<String, String> book) {
    final isOverdue = _isOverdue(book['dueDate']!);
    final daysRemaining = _daysRemaining(book['dueDate']!);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Book icon
            Container(
              width: 60,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.book,
                size: 40,
                color: Colors.blue,
              ),
            ),
            const SizedBox(width: 15),
            // Book details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book['title']!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'by ${book['author']}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, size: 14, color: Colors.grey),
                      const SizedBox(width: 5),
                      Text(
                        'Borrowed: ${book['borrowDate']}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(
                        Icons.event,
                        size: 14,
                        color: isOverdue ? Colors.red : Colors.grey,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Due: ${book['dueDate']}',
                        style: TextStyle(
                          fontSize: 12,
                          color: isOverdue ? Colors.red : Colors.grey[600],
                          fontWeight: isOverdue ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Status indicator
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: isOverdue
                          ? Colors.red[50]
                          : daysRemaining <= 3
                              ? Colors.orange[50]
                              : Colors.green[50],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      isOverdue
                          ? 'OVERDUE'
                          : daysRemaining <= 3
                              ? 'Due in $daysRemaining days'
                              : '$daysRemaining days remaining',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: isOverdue
                            ? Colors.red[700]
                            : daysRemaining <= 3
                                ? Colors.orange[700]
                                : Colors.green[700],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: _showBottomMenu,
          ),
        ],
        title: const Text(
          'Library',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Borrowed Books',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '${borrowedBooks.length} ${borrowedBooks.length == 1 ? 'book' : 'books'} currently borrowed',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),

              // Books list
              borrowedBooks.isEmpty
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(50),
                        child: Column(
                          children: [
                            Icon(
                              Icons.book_outlined,
                              size: 80,
                              color: Colors.grey[400],
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'No borrowed books',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Visit the library to borrow books',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[500],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: borrowedBooks.length,
                      itemBuilder: (context, index) {
                        return _buildBookCard(borrowedBooks[index]);
                      },
                    ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}