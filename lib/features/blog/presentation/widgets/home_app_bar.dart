import 'package:flutter/material.dart';

AppBar getHomeAppBar() {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    leading: IconButton(
      icon: const Icon(Icons.sort),
      onPressed: () {
        // Handle menu icon tap
      },
    ),
    title: const Text(
      "Welcome back!",
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
    ),
    centerTitle: true, // Center the title
    actions: <Widget>[
      GestureDetector(
        onTap: () {
          // Handle user profile tap
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ClipOval(
            child: Image.asset(
              "assets/images/user.jpg",
              width: 37,
              height: 37,
            ),
          ),
        ),
      ),
    ],
  );
}
