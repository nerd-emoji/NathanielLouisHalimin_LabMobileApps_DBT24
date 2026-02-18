import 'package:flutter/material.dart';
import 'dart:math' as math;

class ContainerModel {
  final int index;
  final Color color;
  final double initialAngle;
  final List<Widget> children;
  double currentAngle;
  double currentOffset;
  double previousOffset;
  bool isVisible;

  ContainerModel({
    required this.index,
    required this.color,
    required this.initialAngle,
    List<Widget>? children,
    this.isVisible = true,
  }) : children = children ?? [],
       currentAngle = initialAngle,
       currentOffset = 0.0,
       previousOffset = 0.0;

  void moveOffScreen() {
    isVisible = false;
    previousOffset = currentOffset;
    currentOffset = 1000.0;
  }

  void rotateByDegrees(double degrees) {
    currentAngle += degrees * math.pi / 180;
  }

  void reset() {
    isVisible = true;
    currentAngle = initialAngle;
    currentOffset = 0.0;
    previousOffset = 0.0;
  }
}


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int clicked = 0;
  late List<ContainerModel> containers;

  final List<Color> containerColors = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.pink,
    Colors.teal,
    Colors.amber,
  ];

  @override
  void initState() {
    super.initState();
    containers = List.generate(
      8,
      (index) => ContainerModel(
        index: index,
        color: containerColors[index],
        initialAngle: -index * 10 * math.pi / 180,
        children: _buildContainerContent(index),
      ),
    );
  }

  List<Widget> _buildContainerContent(int index) {
    switch (index) {
      case 0:
        return [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg1.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.star, size: 50, color: Colors.white),
                  SizedBox(height: 10),
                  Text('Container 1', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ];
      case 1:
        return [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg2.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.favorite, size: 50, color: Colors.white),
                  SizedBox(height: 10),
                  Text('Container 2', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ];
      case 2:
        return [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg3.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.shopping_bag, size: 50, color: Colors.white),
                  SizedBox(height: 10),
                  Text('Container 3', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ];
      case 3:
        return [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg4.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.pets, size: 50, color: Colors.white),
                  SizedBox(height: 10),
                  Text('Container 4', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ];
      case 4:
        return [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg5.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.music_note, size: 50, color: Colors.white),
                  SizedBox(height: 10),
                  Text('Container 5', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ];
      case 5:
        return [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg6.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.camera_alt, size: 50, color: Colors.white),
                  SizedBox(height: 10),
                  Text('Container 6', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ];
      case 6:
        return [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg7.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.sports_basketball, size: 50, color: Colors.white),
                  SizedBox(height: 10),
                  Text('Container 7', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ];
      case 7:
        return [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg8.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.sunny, size: 50, color: Colors.white),
                  SizedBox(height: 10),
                  Text('Container 8', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ];
      default:
        return [
          Center(
            child: Text(
              'Container ${index + 1}',
              style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ];
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> containerWidgets = [];
    
    for (int index = 0; index < 8; index++) {
      final container = containers[index];
      
      containerWidgets.add(
        GestureDetector(
          onTap: () {
            if (!container.isVisible) return;
            
            setState(() {
              clicked++;
              
              // Count remaining visible containers
              int visibleCount = containers.where((c) => c.isVisible).length;
              
              // If this is the last visible container, reset all
              if (visibleCount == 1) {
                for (int i = 0; i < containers.length; i++) {
                  containers[i].reset();
                }
              } else {
                // Move clicked container off screen
                container.moveOffScreen();
                
                // Rotate all remaining visible containers by +10 degrees
                for (int i = 0; i < containers.length; i++) {
                  if (containers[i].isVisible) {
                    containers[i].rotateByDegrees(10);
                  }
                }
              }
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Container ${index + 1} clicked!')),
            );
          },
          child: TweenAnimationBuilder<Offset>(
            tween: Tween<Offset>(
              begin: Offset(container.previousOffset, 0),
              end: Offset(container.currentOffset, 0),
            ),
            duration: const Duration(milliseconds: 500),
            builder: (context, animatedOffset, child) {
              return Transform.translate(
                offset: animatedOffset,
                child: TweenAnimationBuilder<double>(
                  tween: Tween<double>(
                    begin: container.currentAngle - (10 * math.pi / 180),
                    end: container.currentAngle,
                  ),
                  duration: const Duration(milliseconds: 500),
                  builder: (context, animatedAngle, child) {
                    return Transform.rotate(
                      angle: animatedAngle,
                      child: Container(
                        height: 400.0,
                        width: 300.0,
                        color: container.color,
                        child: Stack(
                          children: container.children.isNotEmpty 
                            ? container.children 
                            : [
                                Center(
                                  child: Text(
                                    'Container ${index + 1}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
          ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: const Text('WasteWrap'),
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'Your WasteWrap is Ready!', 
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 0),
          const Text(
            'See How You Made an Impact!', 
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 50),
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: containerWidgets.reversed.toList(),
            ),
          ),
        ],
      ),
    );
  }
}