import 'package:flutter/material.dart';

SnackBar customSnackBar(String message) {
  return SnackBar(
    content: Text(message),
    backgroundColor: Colors.red,
    duration: Duration(seconds: 2),
  );
}
