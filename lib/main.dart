import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("The Tracker App"),
          backgroundColor: const Color.fromARGB(255, 255, 77, 77),
        ),
        body: Center(
          child: Text(
            "Hello World!",
            style: TextStyle(
              fontFamily: "Raleway",
              fontSize: 40,
              color: const Color.fromARGB(255, 15, 15, 14),
            ),
          ),
        ),
      ),
    );
  }
}
