import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tracker App - Task 16',
      home: AnimatedContainerExample(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
    );
  }
}

class AnimatedContainerExample extends StatefulWidget {
  @override
  _AnimatedContainerExampleState createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample>{
  bool _isChanged=false;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Animated Container App'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      
      body: Center(
        child: AnimatedContainer(
          duration:Duration(seconds: 1),
          curve:Curves.easeInOut,
          width: _isChanged ? 200 : 100,
          height: _isChanged ?100:200,

          decoration: BoxDecoration(
            color: _isChanged? const Color.fromARGB(255, 255, 0, 0) :Colors.blue,
            borderRadius: BorderRadius.circular(_isChanged?30 :0),
                      ),
      ),
      ),
      floatingActionButton:FloatingActionButton(
        onPressed: (){
          setState(() {
          _isChanged=!_isChanged;
          });
        },
        child: Icon(Icons.play_arrow),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      )
    );
  }
}