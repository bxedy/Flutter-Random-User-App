import 'package:flutter/material.dart';

void showCustomSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(8),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.blueGrey.shade800,
    ),
  );
}
