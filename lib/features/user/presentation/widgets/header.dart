import 'package:flutter/material.dart';

AppBar header() {
  return AppBar(
    backgroundColor: Color.fromARGB(255, 255, 255, 255),
    title: Padding(
      padding: const EdgeInsets.only(left: 32.0),
      child: Stack(
        children: [
          Text(
            "Profile",
            textAlign: TextAlign.left,
            style: TextStyle(
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 2
                ..color = const Color.fromARGB(
                    255, 253, 239, 239), // Stroke color (#000000)
              fontFamily: "Urbanist",
              fontWeight: FontWeight.w700,
              fontSize: 24,
            ),
          ),
          const Text(
            "Profile",
            textAlign: TextAlign.left,
            style: TextStyle(
              color:
                  Color.fromRGBO(13, 37, 60, 1), // Fill color (#0D253C) in RGBA
              fontFamily: "Urbanist",
              fontWeight: FontWeight.w700,
              fontSize: 24,
            ),
          ),
        ],
      ),
    ),
    // leading: Placeholder(),
    actions: [
      IconButton(
        icon: Icon(Icons.more_horiz, color: Color.fromARGB(255, 0, 0, 0)),
        onPressed: () {
          // Add your three dots menu logic here
        },
      ),
    ],
    elevation: 0,
  );
}
