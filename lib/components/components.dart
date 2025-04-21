import 'package:flutter/material.dart';
import 'package:gro_fast/styles/style.dart';

////////////////////////////////////////
///////////Text Form Field/////////////
//////////////////////////////////////
Widget textFormField({
  required String hintText,
  required IconData icon,
  //required String message,
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
      prefixIcon: Icon(icon),
      fillColor: Colors.white,
      filled: true,
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return hintText;
      }
      return null;
    },
  );
}

//////////////////////////////////////
///////////Elevated Button///////////
////////////////////////////////////
class elevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final Color color;
  final TextStyle? textStyle;

  const elevatedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.color = Colors.green,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: textStyle ??
              const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
        ),
      ),
    );
  }
}

//////////////////////////////////
//////////Text Button////////////
////////////////////////////////
Widget textButton({
  required String text,
  required VoidCallback onPressed,
}) {
  return TextButton(
    onPressed: onPressed,
    child: Text(
      text,
      style: textStyle ??
          const TextStyle(
            color: Colors.blue,
            fontSize: 14,
          ),
    ),
  );
}
