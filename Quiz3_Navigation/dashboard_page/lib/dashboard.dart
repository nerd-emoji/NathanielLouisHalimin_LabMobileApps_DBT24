import 'package:flutter/material.dart';
import 'library.dart';
import 'profile.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final Map<String, List<Map<String, String>>> timetable = {
    'Monday': [
      {'time': '08:00 - 09:30', 'subject': 'Mathematics', 'room': 'A101', 'teacher': 'Mr. Smith'},
      {'time': '09:45 - 11:15', 'subject': 'Physics', 'room': 'B203', 'teacher': 'Dr. Johnson'},
      {'time': '11:30 - 13:00', 'subject': 'English', 'room': 'C105', 'teacher': 'Ms. Brown'},
      {'time': '14:00 - 15:30', 'subject': 'Chemistry', 'room': 'B201', 'teacher': 'Dr. Williams'},
    ],
    'Tuesday': [

    ],
    'Wednesday': [
      {'time': '08:00 - 09:30', 'subject': 'Mathematics', 'room': 'A101', 'teacher': 'Mr. Smith'},
      {'time': '09:45 - 11:15', 'subject': 'Physical Education', 'room': 'Gym', 'teacher': 'Coach Lee'},
      {'time': '11:30 - 13:00', 'subject': 'Art', 'room': 'F201', 'teacher': 'Ms. Anderson'},
    ],
    'Thursday': [

    ],
    'Friday': [

    ],
  };

  String _selectedDay = 'Monday';

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
        return; 
      case 'Library':
        page = const Library();
        break;
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

  Widget _buildDaySelector() {
    final days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];
    
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: days.length,
        itemBuilder: (context, index) {
          final day = days[index];
          final isSelected = day == _selectedDay;
          
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedDay = day;
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected ? Colors.blue : Colors.grey[200],
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  day.substring(0, 3), 
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black87,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildClassCard(Map<String, String> classInfo) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Container(
              width: 4,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    classInfo['subject']!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.access_time, size: 16, color: Colors.grey),
                      const SizedBox(width: 5),
                      Text(
                        classInfo['time']!,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      const Icon(Icons.room, size: 16, color: Colors.grey),
                      const SizedBox(width: 5),
                      Text(
                        classInfo['room']!,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 15),
                      const Icon(Icons.person, size: 16, color: Colors.grey),
                      const SizedBox(width: 5),
                      Text(
                        classInfo['teacher']!,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                    ],
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
    final classes = timetable[_selectedDay] ?? [];
    
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
          'Dashboard',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg.png',
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'My Timetable',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'View your class schedule',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            
            _buildDaySelector(),
            
            const SizedBox(height: 10),
            
            classes.isEmpty
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Text(
                        'No classes scheduled for $_selectedDay',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: classes.length,
                    itemBuilder: (context, index) {
                      return _buildClassCard(classes[index]);
                    },
                  ),
            
            const SizedBox(height: 20),
          ],
        ),
          ),
        ],
      ),
    );
  }
}