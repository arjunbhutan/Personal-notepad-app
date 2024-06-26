// main.dart

import 'package:flutter/material.dart';
import 'event.dart';
import 'services.dart';
import 'others.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Kuzu Zangpo la'),
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
  int _currentIndex = 0;

  final List<Widget> _pages = [
    EventPage(),
    ServicesPage(),
    OthersPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(
          children: [
            // Top section (1/4 of the screen)
            Container(
              height: MediaQuery.of(context).size.height / 4,
              color: Colors.amberAccent[400],
              child: Stack(
                children: [
                  Positioned(
                    top: 126.0,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 35.0),
                        child: Text(
                          widget.title,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0.0,
                    left: 0,
                    right: 0,
                    top: 35,
                    child: Center(
                      child: Opacity(
                        opacity: 0.2,
                        child: Container(
                          height: 600,
                          width: 250,
                          child: Image.network(
                            'https://upload.wikimedia.org/wikipedia/commons/9/9e/Dragon_of_Bhutan.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // TabBar
            Container(
              color: Colors.blue[50],
              child: TabBar(
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                tabs: [
                  Tab(icon: Icon(Icons.event), text: 'Event'),
                  Tab(icon: Icon(Icons.build), text: 'Services'),
                  Tab(icon: Icon(Icons.more), text: 'Others'),
                ],
              ),
            ),
            // Content area
            Expanded(
              child: Container(
                color: Colors.blue[50],
                child: _pages[_currentIndex],
              ),
            ),
          ],
        ),
      ),
    );
  }
}