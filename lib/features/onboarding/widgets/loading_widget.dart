// loading alert dialog widget
import 'package:flutter/material.dart';

Widget loadingDialog(BuildContext context) {
  return const AlertDialog(
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularProgressIndicator(
          semanticsLabel: 'Circular progress indicator',
          color: Color(0xFF2D4379),
        ),
        SizedBox(height: 16.0),
        Text(
          'Loading...',
          style: TextStyle(fontSize: 16.0),
        ),
      ],
    ),
  );
}
