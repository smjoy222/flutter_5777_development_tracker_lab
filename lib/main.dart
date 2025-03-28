import 'package:flutter/material.dart';

void main() {
  runApp(const StyledTextApp());
}

class StyledTextApp extends StatelessWidget {
  const StyledTextApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TextStyleScreen(), // Added home widget here
    );
  }
}

class TextStyleScreen extends StatelessWidget {
  const TextStyleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("The Tracker App"),
        backgroundColor: const Color.fromARGB(255, 255, 77, 77),
      ),
      body: Center( 
        child: Column(
          mainAxisSize: MainAxisSize.min, 
          children: [
            const Text(
              'This is Task 4',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.lineThrough,
                color: Color.fromARGB(255, 5, 110, 17),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'ID:221-15-5777',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                fontStyle: FontStyle.italic,
                color: Color.fromARGB(255, 6, 131, 165),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Section: 61_A1',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: Color.fromARGB(255, 248, 132, 0),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Design Text!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 226, 7, 7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
