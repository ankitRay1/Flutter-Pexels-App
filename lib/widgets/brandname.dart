import 'package:flutter/material.dart';

Widget brandName() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      Text(
        "Pexels",
        style: TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,
            fontSize: 28.0,
            letterSpacing: -1.2),
      ),
      Text(
        "App",
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 28.0,
            letterSpacing: -1.2),
      )
    ],
  );
}
