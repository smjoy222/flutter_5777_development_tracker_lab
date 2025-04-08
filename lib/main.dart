import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen(), debugShowCheckedModeBanner: false);
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 25, 196, 6),
        elevation: 100,
        title: Row(
          children: [
            Image.asset("assets/images/biglogo.jpg", width: 40, height: 40),
            Text(
              "  Bazar Sadaai App",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment:
              CrossAxisAlignment.center, // ensures horizontal centering
          children: [
            Image.asset("assets/images/biglogo.jpg", width: 300, height: 300),
            SizedBox(height: 16), // optional spacing
            Text(
              "Home Screen",
              textAlign: TextAlign.center, // centers text content
              style: TextStyle(
                fontSize: 45,
                color: Color.fromARGB(255, 5, 196, 21),
              ),
            ),
            SizedBox(height: 8), // optional spacing
            Text(
              "Customize App Bar, Logo, Title, Action Button",
              textAlign: TextAlign.center, // centers text content
              style: TextStyle(
                fontSize: 27,
                color: Color.fromARGB(255, 55, 74, 57),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
