import 'package:flutter/material.dart';

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
    ),
  );
}

////////////////////////////////
/// Profile Button/////////////
/// //////////////////////////
Widget profileButton({
  required IconData icon,
  required String label,
  required VoidCallback onTap,
  Color iconColor = Colors.black,
  Color textColor = Colors.black,
  Color backgroundColor = const Color.fromARGB(255, 168, 168, 168),
  double elevation = 1.0,
}) {
  return Card(
    color: backgroundColor,
    elevation: elevation,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    child: ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(
        label,
        style: TextStyle(color: textColor, fontSize: 16),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: iconColor, size: 16),
      onTap: onTap,
    ),
  );
}

/////////////////////////////////////
//////////////SnackBar//////////////
///////////////////////////////////

void snackbar_msg(
    {required BuildContext context,
    required String title,
    String subtitle = '',
    Color backgroundColor = const Color.fromARGB(255, 219, 222, 219),
    Duration duration = const Duration(seconds: 2),
    IconData icon = Icons.notification_add}) {
  final overlay = Overlay.of(context);
  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: MediaQuery.of(context).padding.top + 10,
      left: 10,
      right: 10,
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(12),
        color: Colors.transparent,
        child: Container(
            //padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: Icon(icon),
              title: Text(
                title,
                style: const TextStyle(color: Colors.black, fontSize: 16),
                textAlign: TextAlign.left,
              ),
              subtitle: Text(
                subtitle,
                textAlign: TextAlign.left,
              ),
            )),
      ),
    ),
  );

  // Insert the overlay
  overlay.insert(overlayEntry);

  // Remove the overlay after the duration
  Future.delayed(duration).then((value) {
    overlayEntry.remove();
  });
}
