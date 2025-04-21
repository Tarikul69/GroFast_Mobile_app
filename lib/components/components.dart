import 'package:flutter/material.dart';

Widget textFormField({
  required String hintText,
  required IconData,
}) {
  return TextFormField(
    obscureText: true,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.grey[600]),
      contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.green, width: 1.5),
      ),
      prefixIcon: Icon(Icons.lock_outline),
      fillColor: Colors.white,
      filled: true,
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your password';
      }
      return null;
    },
  );
}
