import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ShowPopular extends StatefulWidget {
  const ShowPopular({super.key});

  @override
  State<ShowPopular> createState() => _ShowPopularState();
}

class _ShowPopularState extends State<ShowPopular> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Show poular plcaes"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('places').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var pname = snapshot.data!.docs[index]['name'];
                  var pprice = snapshot.data!.docs[index]['price'];
                  return ListTile(
                    title: Text(pname),
                    subtitle: Text(pprice),
                  );
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
