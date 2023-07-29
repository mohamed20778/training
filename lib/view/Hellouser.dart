import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class hellouser extends StatefulWidget {


   hellouser({super.key});

  @override
  State<hellouser> createState() => _hellouserState();
}

class _hellouserState extends State<hellouser> {

  String email="";
  void getstring()
  async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email')??"";
    setState(() {

    });
  }


  @override
  void initState() {
    super.initState();
    getstring();
    // TODO: implement initState

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(

    ),
    body: Text('welcome$email'),
    );
  }
}


