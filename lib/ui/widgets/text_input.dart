import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  const InputText({
    Key? key,
    required this.controller,
    required this.labelText,
    this.obscureText = false,
  }) : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorHeight: 22,
      obscureText: obscureText,
      style: const TextStyle(fontSize: 22),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.only(top: 8, bottom: 8, right: 8, left: 16),
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.green),
        ),
      ),
    );
  }
}
