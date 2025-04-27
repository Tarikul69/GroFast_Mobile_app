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

///////////////////////////////////////
/////////////Notification Card////////
/// /////////////////////////////////
Widget notificationCard({
  required IconData icon,
  required String title,
  String subtitle = '',
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
        title: Text(title),
        subtitle: Text("data"),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: iconColor, size: 16),
      onTap: onTap,
    ),
  );
}
