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
      title: 'Tracker App - Task 14',
      theme: ThemeData.dark(),
      home: SwipeListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SwipeListScreen extends StatefulWidget {
  @override
  _SwipeListScreenState createState() => _SwipeListScreenState();
}

class _SwipeListScreenState extends State<SwipeListScreen> {
  List<String> items = List.generate(15, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        
        title: Text('Tracker App - Swap to Edit/Delete',),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 3, 215, 215),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return Dismissible(
            key: Key(item),
            background: Container(
              color: Colors.blue,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 20),

              child: Icon(Icons.edit, color: Colors.white, size: 30),
            ),
            secondaryBackground: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Icon(Icons.delete, color: Colors.white, size: 30),
            ),
            onDismissed: (direction) {
              if (direction == DismissDirection.endToStart) {
                setState(() {
                  items.removeAt(index);
                });

                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('$item deleted')));
              } else if (direction == DismissDirection.startToEnd) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Edit $item')));
              }
            },
            child: Card(
              elevation: 2,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: ListTile(
                title: Text(item),
                //leading: Icon(Icons.list),
              ),
            ),
          );
        },
      ),
    );
  }
}
