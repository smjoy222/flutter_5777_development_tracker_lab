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
      title: 'Tracker App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Tracker App - Custom Container'),backgroundColor: Color.fromARGB(255, 242, 255, 2)),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        body: const Center(
          child: CustomContainer(),
        ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color:Colors.blue,
        borderRadius: BorderRadius.circular(20),
        boxShadow:[ BoxShadow(
          color: Colors.black.withOpacity(0.3),
          blurRadius: 10,
          spreadRadius: 2,
          offset: Offset(5,5),
          
        
        ),
        ],
      ),
      child: const Text('This Is The Custom Container With Text Widget!',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      ),
      
    );
  }
}