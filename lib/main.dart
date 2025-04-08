import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imageLinks = [
    "https://iro.umy.ac.id/wp-content/uploads/2022/09/daffodil-international-university-logo-300x300.png",
    "https://i.ytimg.com/vi/FkLZ3xs-V5w/maxresdefault.jpg",
    "https://www.eduopinions.com/wp-content/uploads/2018/02/Daffodil-International-University-DIU-logo.png",
    "https://i.ytimg.com/vi/S_quwX1MDUE/maxresdefault.jpg",
    "https://daffodilvarsity.edu.bd/photos/shares/diu-trans.jpg",
    "https://i.ytimg.com/vi/S7LTG_D5E_E/maxresdefault.jpg",
    "https://4.bp.blogspot.com/-WhcTkhbrc7E/Vzt22ZjsoZI/AAAAAAAAAQA/h7RO8lRygdcTFJm1DgixaHG7pyDgZppYACLcB/s1600/daffodil%2Binternational%2Buniversity.jpg",
    "https://parents.daffodilvarsity.edu.bd/storage/20/6208ba6f577a8_offices.jpg",
    "https://i.ytimg.com/vi/aFActm0d0DE/maxresdefault.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurpleAccent,
        title: Center(
          child: Text(
            "The Tracker App",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: imageLinks.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return Container(
              //height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(imageLinks[index]),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
