import 'package:flutter/material.dart';

class GroFastCard extends StatelessWidget {
  final Map<String, String> data;

  const GroFastCard({required this.data, required Map<String, String> title});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: data.entries.map((entry) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  Text(
                    '${entry.key}: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green[800],
                    ),
                  ),
                  Expanded(
                    child: Text(
                      entry.value,
                      style: TextStyle(color: Colors.grey[800]),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

//////////////////////////////////////
////////Carousel Card////////////////
////////////////////////////////////
// class CarouselCard extends StatelessWidget {
//   const CarouselCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final List<String> images = [
//       'https://picsum.photos/id/1011/400/200',
//       'https://picsum.photos/id/1012/400/200',
//       'https://picsum.photos/id/1013/400/200',
//     ];

//     return CarouselSlider(
//       options: CarouselOptions(
//         height: 200.0,
//         enlargeCenterPage: true,
//         autoPlay: true,
//         aspectRatio: 16 / 9,
//         autoPlayCurve: Curves.fastOutSlowIn,
//         enableInfiniteScroll: true,
//         autoPlayAnimationDuration: Duration(milliseconds: 800),
//         viewportFraction: 0.8,
//       ),
//       items: images.map((imageUrl) {
//         return Builder(
//           builder: (BuildContext context) {
//             return Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               clipBehavior: Clip.antiAlias,
//               elevation: 5,
//               child: Image.network(
//                 imageUrl,
//                 fit: BoxFit.cover,
//                 width: double.infinity,
//               ),
//             );
//           },
//         );
//       }).toList(),
//     );
//   }
// }

///////////////////////////////////////
/////////////Notification Card////////
/// /////////////////////////////////
Widget notificationCard({
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
      title: ListTile(
        title: Text(label),
        subtitle: Text("data"),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: iconColor, size: 16),
      onTap: onTap,
    ),
  );
}
