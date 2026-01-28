import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.blue,

        title: Text("First Hello World"),
      ),
      body: Center(
          child: Container(
            color: Colors.white,
            child: LayoutBuilder(
              builder: (context, constraints) {
                int rows = 8;
                int cols = 8;
                double squareSize = constraints.maxWidth / cols;
                double boardHeight = squareSize * rows;
                double startY = (constraints.maxHeight - boardHeight) / 2;
                return Stack(
                  children: [
                    for (int row = 0; row < rows; row++)
                      for (int col = 0; col < cols; col++)
                        Positioned(
                          top: startY + (row * squareSize),
                          left: col * squareSize,
                          child: Container(
                            width: squareSize,
                            height: squareSize,
                            color: (row + col) % 2 == 0 
                                ? Colors.white 
                                : Colors.red,
                          ),
                        ),
                  ],
                );
              },
            ),
          ),
        
      ),
    );
  }
}
