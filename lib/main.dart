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
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return const MaterialApp(home: MyHome());
=======
    return MaterialApp(home: MyHome());
>>>>>>> 91de86e2abbc78c6c3e959c0488a4c2a6be3838f
  }
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD
        title: const Text(
          "tourism app 1",
          style: TextStyle(color: Color.fromARGB(255, 34, 44, 34)),
=======
        title: Text(
          "tourism app",
          style: TextStyle(color: const Color.fromARGB(255, 34, 44, 34)),
>>>>>>> 91de86e2abbc78c6c3e959c0488a4c2a6be3838f
        ),
        backgroundColor: const Color.fromARGB(255, 48, 119, 48),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
<<<<<<< HEAD
            padding: const EdgeInsets.all(20),
            color: const Color.fromARGB(255, 176, 255, 179),
            child: const Image(image: AssetImage('images/Salalah1.jpg')),
          ),
          const Text(
=======
            padding: EdgeInsets.all(20),
            color: const Color.fromARGB(255, 176, 255, 179),
            child: Image(image: AssetImage('images/Salalah1.jpg')),
          ),
          Text(
>>>>>>> 91de86e2abbc78c6c3e959c0488a4c2a6be3838f
            'Popular Places',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),

<<<<<<< HEAD
          const Row(
=======
          Row(
>>>>>>> 91de86e2abbc78c6c3e959c0488a4c2a6be3838f
            children: [
              Expanded(
                child: SizedBox(
                  width: 200,
                  child: Image(image: AssetImage("images/Salalah2.jpg")),
                ),
              ),
              Expanded(child: Image(image: AssetImage("images/Salalah3.jpg"))),
            ],
          ),
          Container(
            width: double.infinity,
            color: const Color.fromARGB(255, 40, 121, 43),
<<<<<<< HEAD
            child: const Text(
=======
            child: Text(
>>>>>>> 91de86e2abbc78c6c3e959c0488a4c2a6be3838f
              textAlign: TextAlign.center,
              'featerd place',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
<<<<<<< HEAD
                color: Color.fromARGB(255, 255, 255, 255),
=======
                color: const Color.fromARGB(255, 255, 255, 255),
>>>>>>> 91de86e2abbc78c6c3e959c0488a4c2a6be3838f
              ),
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 187, 187, 187),
<<<<<<< HEAD
            child: const Image(image: AssetImage("images/Salalah4.jpg")),
=======
            child: Image(image: AssetImage("images/Salalah4.jpg")),
>>>>>>> 91de86e2abbc78c6c3e959c0488a4c2a6be3838f
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Test',
        backgroundColor: const Color.fromARGB(255, 114, 155, 115),
<<<<<<< HEAD
        foregroundColor: const Color.fromARGB(255, 248, 248, 248),
        child: const Icon(Icons.home),
=======
        foregroundColor: Color.fromARGB(255, 248, 248, 248),
        child: Icon(Icons.home),
>>>>>>> 91de86e2abbc78c6c3e959c0488a4c2a6be3838f
        onPressed: () {
          print("welcome home");
        },
      ),
    );
  }
}
