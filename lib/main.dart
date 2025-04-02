import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const StyledTextApp());
}

class StyledTextApp extends StatelessWidget {
  const StyledTextApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TextStyleScreen(),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/diu1.jpg'),
          Text(
            'This is 1st page',
            style: GoogleFonts.lato(
              textStyle: const TextStyle(
                fontSize: 25,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SecondScreen()),
              );
            },
            child: const Text('Click here to go - 2nd page'),
          ),
        ],
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("The Tracker App"),
        backgroundColor: const Color.fromARGB(255, 255, 77, 77),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/diu2.jpg'),
          Text(
            'This is 2nd page',
            style: GoogleFonts.lato(
              textStyle: const TextStyle(
                fontSize: 25,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Click here to go 1st page'),
          ),
        ],
      ),
    );
  }
}
