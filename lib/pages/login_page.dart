// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_app/components/my_textfield.dart';
import 'package:sample_app/components/square_tile.dart';
import 'package:sample_app/pages/first_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void signInUser() {}
  void registerUser() {}
  void forgotPassword() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(232, 236, 239, 1),
      body: ListView(
        children: [
          Image.asset(
            'lib/assets/images/bicycle.png',
            height: 280,
          ),
          Center(
            child: Text("Welcome",
                style: GoogleFonts.baskervville(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: 15,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: forgotPassword,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FirstPage()));
              },
              child: Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              )),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 0.8,
                    color: Colors.grey[500],
                  ),
                ),
                Text(
                  "Or continue with",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                Expanded(
                  child: Divider(
                    thickness: 0.8,
                    color: Colors.grey[500],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SquareTile(imagePath: "lib/assets/images/google.png"),
              SizedBox(
                width: 25,
              ),
              SquareTile(imagePath: "lib/assets/images/facebook.png"),
              SizedBox(
                width: 25,
              ),
              SquareTile(imagePath: "lib/assets/images/twitter.png"),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Not a member? ",
                style: TextStyle(fontSize: 15),
              ),
              GestureDetector(
                onTap: registerUser,
                child: Text(
                  "Register here.",
                  style: TextStyle(fontSize: 15, color: Colors.blueAccent),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
