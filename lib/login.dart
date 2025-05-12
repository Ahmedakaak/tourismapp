import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tourism_app/main.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  Future signin() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email.text.trim(), password: _password.text.trim());
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => MyHome()));
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.code),
        backgroundColor: Colors.red,
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("An unexpectoed error occrred. Please try again"),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login page"),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: _email,
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
              controller: _password,
              decoration: InputDecoration(
                  labelText: "Password",
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
                  signin();
                },
                child: Text("login"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
