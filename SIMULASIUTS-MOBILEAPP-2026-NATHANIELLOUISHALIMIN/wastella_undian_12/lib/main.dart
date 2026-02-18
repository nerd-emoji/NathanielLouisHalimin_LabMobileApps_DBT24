import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

class ContainerModel {
  final int index;
  final Color color;
  final double initialAngle;
  final List<Widget> children;
  double currentAngle;
  double currentOffset;
  double previousOffset;
  double currentOffsetY;
  double previousOffsetY;
  bool isVisible;
  double offsetRotation;
  double previousOffsetRotation;

  ContainerModel({
    required this.index,
    required this.color,
    required this.initialAngle,
    List<Widget>? children,
    this.isVisible = true,
  }) : children = children ?? [],
       currentAngle = initialAngle,
       currentOffset = 0.0,
       previousOffset = 0.0,
       currentOffsetY = 0.0,
       previousOffsetY = 0.0,
       offsetRotation = 0.0,
       previousOffsetRotation = 0.0;

  void moveOffScreen() {
    isVisible = false;
    previousOffset = currentOffset;
    currentOffset = 500.0;
    previousOffsetY = currentOffsetY;
    currentOffsetY = -300.0;
    previousOffsetRotation = offsetRotation;
    offsetRotation = -180 * math.pi / 180;
  }

  void rotateByDegrees(double degrees) {
    currentAngle += degrees * math.pi / 180;
  }

  void reset() {
    isVisible = true;
    currentAngle = initialAngle;
    currentOffset = 0.0;
    previousOffset = 0.0;
    currentOffsetY = 0.0;
    previousOffsetY = 0.0;
    offsetRotation = 0.0;
    previousOffsetRotation = 0.0;
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
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
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

  @override
  void initState() {
    super.initState();
    containers = List.generate(
      8,
      (index) => ContainerModel(
        index: index,
        color: Colors.transparent,
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
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  SizedBox(height: 30),
                  Text('Total Waste Contributed', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 70),
                  Text('You\'ve Managed\n16 KG of Waste!', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text('That\'s like saving 99 plastic\nbottles from burning!', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.normal)),
                ],
              ),
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
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  Text('Waste Breakdown', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 30),
                  Text('Your Waste Stats', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 45, vertical: 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        _buildWasteRow('Organic', '5 kg'),
                        Divider(color: Colors.transparent, height: 7),
                        _buildWasteRow('Inorganic', '3 kg'),
                        Divider(color: Colors.transparent, height: 7),
                        _buildWasteRow('Hazardous', '2 kg'),
                        Divider(color: Colors.transparent, height: 7),
                        _buildWasteRow('Residual', '3 kg'),
                        Divider(color: Colors.transparent, height: 7),
                        _buildWasteRow('Paper', '3 kg'),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Text('Small changes, big impact!\nKeep sorting your waste!', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.normal)),
                ],
              ),
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
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  SizedBox(height: 30),
                  Text('Environmental Impact', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 80),
                  Text('You Helped Reduce', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text('15 kg', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold)),
                  SizedBox(height: 0),
                  Text('of CO₂!', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 30),
                  Text('That\'s like burning 6L of\ngasoline!', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.normal)),
                ],
              ),
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
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  SizedBox(height: 30),
                  Text('Energy saved', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 80),
                  Text('Your recycling saved', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text('30 kWh', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold)),
                  SizedBox(height: 0),
                  Text('of electricity!', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 30),
                  Text('That\'s enough to power a\nTV for 150 hours!', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.normal)),
                ],
              ),
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
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  SizedBox(height: 30),
                  Text('Recycling Value', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 70),
                  Text('Your recyclable waste\nis worth', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 0),
                  Text('Rp 39.690', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold)),
                  SizedBox(height: 0),
                  Text('in raw materials!', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 15),
                  Text('Waste isn\'t waste until it recycled\nKeep recycling!', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.normal)),
                ],
              ),
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
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  SizedBox(height: 30),
                  Text('Future Footprint', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 80),
                  Text('You\'ve reduced', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text('10%', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold)),
                  SizedBox(height: 0),
                  Text('of your annual waste!', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 30),
                  Text('Imagine if everyone did the\nsame, massive impact!', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.normal)),
                ],
              ),
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
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  SizedBox(height: 30),
                  Text('Water Saved', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 80),
                  Text('Yo\'ve saved', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text('255L', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold)),
                  SizedBox(height: 0),
                  Text('of water!', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 30),
                  Text('That\'s enough for taking 3\nshort showers!', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.normal)),
                ],
              ),
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
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  SizedBox(height: 30),
                  Text('Eco Score', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 70),
                  Text('Your waste efforts\nrank in the top', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 0),
                  Text('10%', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold)),
                  SizedBox(height: 0),
                  Text('of users!', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 15),
                  Text('You\'re leading the change\nLet\'s push for more!', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.normal)),
                ],
              ),
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

  Widget _buildWasteRow(String wasteType, String amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          wasteType,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          amount,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
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
          },
          child: TweenAnimationBuilder<Offset>(
            tween: Tween<Offset>(
              begin: Offset(container.previousOffset, container.previousOffsetY),
              end: Offset(container.currentOffset, container.currentOffsetY),
            ),
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeIn,
            builder: (context, animatedOffset, child) {
              return Transform.translate(
                offset: animatedOffset,
                child: TweenAnimationBuilder<double>(
                  tween: Tween<double>(
                    begin: container.currentAngle + container.previousOffsetRotation - (10 * math.pi / 180),
                    end: container.currentAngle + container.offsetRotation,
                  ),
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                  builder: (context, animatedAngle, child) {
                    return Transform.rotate(
                      angle: animatedAngle,
                      child: Container(
                        height: 480.0,
                        width: 360.0,
                        color: container.color,
                        padding: EdgeInsets.all(16.0),
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
        backgroundColor: Colors.white,
        leadingWidth: 35,
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: Color(0xFF333333)), iconSize: 40,
          onPressed: () {},
        ),
        title: const Text('WasteWrap', style: TextStyle(color: Color(0xFF333333), fontSize: 17, fontWeight: FontWeight.w900)),
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          const Text(
            'Your WasteWrap is Ready!', 
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 0),
          const Text(
            'See How You Made an Impact!', 
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
          ),
          const SizedBox(height: 25),
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: containerWidgets.reversed.toList(),
            ),
          ),
          const SizedBox(height: 50),
          AnimatedOpacity(
            opacity: containers.where((c) => c.isVisible).length == 1 && containers[7].isVisible ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            child: IgnorePointer(
              ignoring: !(containers.where((c) => c.isVisible).length == 1 && containers[7].isVisible),
              child: GestureDetector(
                onTap: () {
                  // Add button action here
                },
                child: Container(
                  height: 60,
                  width: 250,
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    gradient:  LinearGradient(
                      colors: [Color(0xFF234968), Color(0xFF2E8B57)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Center(
                    child: Text(
                      'Recycle More',
                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}