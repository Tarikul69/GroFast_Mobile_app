import 'package:flutter/material.dart';

// Common background color
const Color backgroundColor = Colors.green;

// Other shared colors
const Color kPrimaryColor = Colors.green;
const Color kAccentColor = Colors.orange;

// Text styles
const TextStyle kHeadingTextStyle = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

TextStyle textStyle([double size = 25]) {
  return TextStyle(
    fontSize: size,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 0, 0, 0),
  );
}
