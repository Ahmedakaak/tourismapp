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
  TextEditingController r = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyHome());
  }
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "tourism app",
          style: TextStyle(color: Color.fromARGB(255, 34, 44, 34)),
        ),
        backgroundColor: const Color.fromARGB(255, 48, 119, 48),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            color: const Color.fromARGB(255, 176, 255, 179),
            child: const Image(image: AssetImage('images/Salalah1.jpg')),
          ),
          const Text(
            'Popular Places in Oman',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          const Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      width: 200,
                      child: Image(image: AssetImage("images/Salalah2.jpg")),
                    ),
                    MyFav(),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Image(image: AssetImage("images/Salalah3.jpg")),
                    MyFav(),
                  ],
                ),
              ),
            ],
          ),
          Container(
            color: const Color.fromARGB(255, 89, 117, 139),
            padding: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(labelText: "write you name"),
            ),
          ),
          Container(
            width: double.infinity,
            color: const Color.fromARGB(255, 40, 121, 43),
            child: const Text(
              textAlign: TextAlign.center,
              'featerd place',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 187, 187, 187),
            child: const Image(image: AssetImage("images/Salalah4.jpg")),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Test',
        backgroundColor: const Color.fromARGB(255, 114, 155, 115),
        foregroundColor: const Color.fromARGB(255, 248, 248, 248),
        child: const Icon(Icons.home),
        onPressed: () {
          print("welcome home");
        },
      ),
    );
  }
}

class MyFav extends StatefulWidget {
  const MyFav({super.key});

  @override
  State<MyFav> createState() => _MyFavState();
}

class _MyFavState extends State<MyFav> {
  bool liked = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() => liked = !liked);
      },
      icon: liked
          ? (const Icon(
              Icons.favorite,
              color: Colors.red,
            ))
          : (const Icon(Icons.favorite)),
    );
  }
}
