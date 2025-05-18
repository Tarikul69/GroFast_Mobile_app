import 'package:carousel_slider/carousel_slider.dart'
    show CarouselOptions, CarouselSlider;
import 'package:flutter/material.dart';
import 'package:gro_fast/model/shop_model.dart';

////////////////////////////////////////
///////////Text Form Field/////////////
//////////////////////////////////////
Widget textFormField({
  required String hintText,
  required IconData icon,
  TextEditingController? controller,
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

Widget carousel_slider(dynamic home_controller) {
  return CarouselSlider(
    options: CarouselOptions(
      height: 250,
      enlargeCenterPage: true,
      enableInfiniteScroll: false,
      autoPlay: true,
    ),
    items: home_controller.shops.map((shop) {
      return Builder(
        builder: (BuildContext context) {
          return InkWell(
            onTap: () {
              //Navigator.pushNamed(context, AppRoutes.shop, arguments: args);
            },
            child: Card(
              elevation: 4,
              margin: const EdgeInsets.all(8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                padding: const EdgeInsets.all(12),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/shop.png'),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "${shop['shop_name'] ?? 'No Name'}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(shop['shop_address'] ?? 'No Address'),
                    Text("Phone: ${shop['shop_phone_number'] ?? 'N/A'}"),
                    Text("Rating: ${shop['shop_rating'] ?? '0.0'}"),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }).toList(),
  );
}
