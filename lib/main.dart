import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GridViewScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class GridViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("The Tracker App - Local Image"),
        backgroundColor: const Color.fromARGB(255, 184, 222, 241),
      ),
      body: Center(child: Image.asset("assets/images/biglogo.jpg")),
    );
  }
}
