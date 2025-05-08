import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({super.key});

  @override
  State<MyRegister> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyRegister> {
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _cpass = TextEditingController();
  TextEditingController _birthday = TextEditingController();
  Future registration() async {
    if (_password.text == _cpass.text) {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _email.text.trim(), password: _password.text.trim())
          .then((Value) {})
          .catchError((error) {
            print(error.toString());
          })
          .then((value) =>
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Registration Sucessfull!!"),
                duration: Duration(seconds: 2),
              )))
          .catchError((error) =>
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Fauld to Registration!!"),
                duration: Duration(seconds: 2),
              )));

      addUserDetails();
    }
  }

  Future addUserDetails() async {
    await FirebaseFirestore.instance.collection("Users").add({
      'email': _email.text.trim(),
      'fullname': _username.text.trim(),
      'birthday': _birthday.text.trim(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      appBar: AppBar(
        title: Text("Register page"),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: _username,
              decoration: InputDecoration(
                  labelText: "UserName",
                  prefixIcon: Icon(Icons.account_circle),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: _email,
              decoration: InputDecoration(
                  labelText: "Example@Example.com",
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: _phone,
              decoration: InputDecoration(
                  labelText: "Phone Number",
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: _birthday,
              decoration: InputDecoration(
                  labelText: "birthday",
                  prefixIcon: Icon(Icons.cake),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: _password,
              decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: Icon(Icons.key_rounded),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: _cpass,
              decoration: InputDecoration(
                  labelText: "confirem Password",
                  prefixIcon: Icon(Icons.key_rounded),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 150, right: 150),
              child: OutlinedButton(
                style: ButtonStyle(),
                onPressed: () {
                  registration();
                },
                child: Text("Register"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
