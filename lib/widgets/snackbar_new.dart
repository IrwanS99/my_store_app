import 'package:flutter/material.dart';

void snackbar(BuildContext context, String message, Color warna) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      showCloseIcon: true,
      closeIconColor: Colors.white,
      backgroundColor: warna,
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      duration: const Duration(seconds: 2),
    ),
  );
}
