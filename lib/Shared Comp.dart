

import 'package:flutter/material.dart';

Widget clickButton(
{
  required final void Function()?onclick,
  required final Color? background,
  required final String? label,
  double width=double.infinity,
  required double radius,

}
)=>Container(
  width: width,
  decoration: BoxDecoration(
    color: background != null?Colors.red:background,
    borderRadius: BorderRadius.circular(radius),
  ),
  child:   MaterialButton(
    child: Text(
      label!,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20
      ),
    ),
      onPressed:onclick,
  ),
);