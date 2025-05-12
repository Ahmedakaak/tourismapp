import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddPopular extends StatefulWidget {
  const AddPopular({super.key});

  @override
  State<AddPopular> createState() => _AddPopularState();
}

class _AddPopularState extends State<AddPopular> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _price = TextEditingController();

  Future saveRecord() async {
    await FirebaseFirestore.instance
        .collection("places")
        .add({
          'name': _name.text.trim(),
          'price': _price.text.trim(),
        })
        .then((value) =>
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Saved place Sucessfull!!"),
              duration: Duration(seconds: 2),
            )))
        .catchError((error) =>
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Faild to save!!"),
              duration: Duration(seconds: 2),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add poular plcaes"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: ListView(
          children: [
            Text(
              "Add popular places Form",
              textAlign: TextAlign.center,
            ),
            TextFormField(
              controller: _name,
              decoration: InputDecoration(
                  label: Text("popular place"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _price,
              decoration: InputDecoration(
                  label: Text("place price"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            ElevatedButton(
                onPressed: () {
                  saveRecord();
                },
                child: Text("save Record"))
          ],
        ),
      ),
    );
  }
}
