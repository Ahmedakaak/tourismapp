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

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final TextEditingController currency = TextEditingController();
  double currency_rate = 0;
  String radioType = "mc";
  double Discount = 0.0;
  double netRate = 0.0;
  bool ta = false;
  bool tb = false;
  double tourPrice = 0.0;
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
      body: SingleChildScrollView(
        child: Column(
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
              color: const Color.fromARGB(255, 255, 255, 255),
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: currency,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.money),
                    border: OutlineInputBorder(),
                    labelText: "write you name"),
              ),
            ),
            OutlinedButton(
                onPressed: () {
                  setState(() {
                    currency_rate = double.parse(currency.text) * 2.6;
                  });
                },
                child: Text("convert")),
            Text(
              "OMR TO USD: " + currency_rate.toStringAsFixed(3),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
            Container(
              padding: EdgeInsets.all(10),
              child: Text("Tour Discount" + netRate.toStringAsFixed(3)),
            ),
            RadioListTile(
                title: Text("Member Customer"),
                value: "mc",
                groupValue: radioType,
                onChanged: (value) {
                  setState(() {
                    radioType = value.toString();
                    if (currency.text.isNotEmpty &&
                        double.parse(currency.text) != 0) {
                      Discount = double.parse(currency.text) * 0.5;
                      netRate = double.parse(currency.text) - Discount;
                    }
                  });
                }),
            RadioListTile(
                title: Text("Guset Customer"),
                value: "gc",
                groupValue: radioType,
                onChanged: (value) {
                  setState(() {
                    radioType = "gc";
                    if (currency.text.isNotEmpty &&
                        double.parse(currency.text) != 0) {
                      Discount = double.parse(currency.text) * 0.1;
                      netRate = double.parse(currency.text) - Discount;
                    }
                  });
                }),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                "Tour : " + tourPrice.toStringAsFixed(3),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            CheckboxListTile(
                title: Image(image: AssetImage("images/Salalah1.jpg")),
                value: tb,
                onChanged: (value) {
                  setState(() {
                    tb = value!;
                    if (tb) {
                      tourPrice += 50;
                    } else {
                      tourPrice -= 50;
                    }
                  });
                }),
            CheckboxListTile(
                title: Image(image: AssetImage("images/Salalah2.jpg")),
                value: ta,
                onChanged: (value) {
                  setState(() {
                    ta = value!;
                    if (ta) {
                      tourPrice += 50;
                    } else {
                      tourPrice -= 50;
                    }
                  });
                })
          ],
        ),
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
