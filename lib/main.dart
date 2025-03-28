import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _displayText = "Click The Button";
  void _changeText(){
    setState(() {
      _displayText = "Button pressed";
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Text(
                _displayText,
                style: TextStyle(fontSize: 30),
              ),
              ElevatedButton(onPressed: _changeText, child: Text("Press")),
            ],
          ),
        ),
      ),
    );
  }
}