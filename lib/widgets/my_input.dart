import 'package:flutter/material.dart';

class MyInputField extends StatelessWidget {
  MyInputField({
    super.key,
    required this.controller,
    required this.lable,
  });
  TextEditingController controller;
  String lable;
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        color: Colors.white,
      ),
      controller: controller,
      decoration: InputDecoration(
        label: Text(
          lable,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
