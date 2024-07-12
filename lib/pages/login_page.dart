// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sample_app/components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          Container(
            height: 250,
            decoration: BoxDecoration(color: Colors.purple[300]),
          ),
          SizedBox(
            height: 20,
          ),
          MyTextfield(
            controller: usernameController,
            hintText: "Username",
            obscureText: false,
            icon: Icon(Icons.person),
          ),
          SizedBox(
            height: 15,
          ),
          MyTextfield(
            controller: passwordController,
            hintText: "Password",
            obscureText: true,
            icon: Icon(Icons.key_outlined),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Forgot Password?",
            style: TextStyle(fontSize: 15),
          )
        ],
      ),
    );
  }
}
