import 'package:flutter/material.dart';

ElevatedButton defaultButton(
    {required String text, required VoidCallback press}) {
  return ElevatedButton(
    clipBehavior: Clip.antiAlias,
    style: ElevatedButton.styleFrom(
      shape: StadiumBorder(),
      primary: Colors.blue,
      minimumSize: Size(double.infinity, 60),
    ),
    onPressed: press,
    child: Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
  );
}
