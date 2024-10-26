// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ProfileTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final Icon icon;
  final bool editable;

  const ProfileTextfield({
      super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText,
      required this.icon,
      required this.editable
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller,
        readOnly: editable,
        decoration: InputDecoration(
            prefixIcon: icon,
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            fillColor: Colors.white,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 25)),
        obscureText: obscureText,
      ),
    );
  }
}
