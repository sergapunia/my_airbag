import 'package:flutter/material.dart';

showSnackbar(
  BuildContext context,
  String text,
  bool error,
) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.transparent,
    padding: const EdgeInsets.symmetric(),
    content: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: error == true
            ? const Color.fromARGB(255, 60, 15, 11)
            : const Color.fromARGB(255, 32, 7, 36),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  ));
}
