import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class fireBaseUser extends StatefulWidget {

  const fireBaseUser({super.key});

  @override
  State<fireBaseUser> createState() => _fireBaseUserState();
}

class _fireBaseUserState extends State<fireBaseUser> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('product').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
              return ListTile(
                title: Text(data['name']),
                subtitle: Text(data['company']),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
