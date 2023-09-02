import 'package:flutter/material.dart';

class AddButtonCustom extends StatelessWidget {
  AddButtonCustom({super.key, required this.onpressed});
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      child: CircleAvatar(
          backgroundColor: Colors.white,
          // radius: 12,
          child: IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(Icons.add_circle_outline),
              color: Colors.blue,
              onPressed: onpressed)

          // print();

          ),
    );
  }
}
