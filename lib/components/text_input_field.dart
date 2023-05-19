import 'package:flutter/material.dart';

class UserInput extends StatelessWidget {
  final controller;
  final String inputLabel;
  final String hintText;
  final bool obscureText;

  const UserInput({
    super.key,
    required this.controller,
    required this.inputLabel,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: inputLabel,
          hintText: hintText,
        ),
      ),
    );
  }
}
