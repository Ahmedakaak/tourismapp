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
    return MaterialApp(home: MyHome());
  }
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "tourism app",
          style: TextStyle(color: const Color.fromARGB(255, 34, 44, 34)),
        ),
        backgroundColor: const Color.fromARGB(255, 48, 119, 48),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            color: const Color.fromARGB(255, 176, 255, 179),
            child: Image(image: AssetImage('images/Salalah1.jpg')),
          ),

          Row(
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
        ],
      ),
    );
  }
}
