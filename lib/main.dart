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
         body: ListView.builder(
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Center(
                child: Text("Item Number: $index",selectionColor: Color.fromARGB(0, 16, 164, 36),),
              
              ),
            );
          },
        ),
       ),
     );
   }
 }