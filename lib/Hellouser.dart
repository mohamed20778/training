import 'package:flutter/material.dart';

class hellouser extends StatefulWidget {
   String email;

   hellouser({super.key,required this.email});

  @override
  State<hellouser> createState() => _hellouserState();
}

class _hellouserState extends State<hellouser> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(

    ),
    body: Text('welcome${widget.email}'),
    );
  }
}


