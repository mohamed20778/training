import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class loginButton extends StatefulWidget {
  final void Function()?onclick;
  final Color? background;
  final String? label;
  double? width;
  double radius;
  loginButton({super.key,this.background,required this.label,this.width=double.infinity,this.onclick,required this.radius});

  @override
  State< loginButton> createState() => _sharedCompState();
}

class _sharedCompState extends State< loginButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,

      decoration: BoxDecoration(
          color: widget.background != null?Colors.red:widget.background,
        borderRadius: BorderRadius.circular(widget.radius)
      ),
      child: MaterialButton
        (
        onPressed: widget.onclick,
        child: Text(
          widget.label!,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20
          ),
        ),

      ),
    );
  }
}
