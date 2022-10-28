import 'package:flutter/material.dart';

void showCustomSnackBar(BuildContext context, String text, IconData icon) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 20,),
            const SizedBox(width: 10),
            Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
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
