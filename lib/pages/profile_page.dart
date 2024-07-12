// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/images/mount.jpg"),
            fit: BoxFit.cover,
          )
        ),
        child: Center(
          child: Text("Profile Page"),
        ),
      ),
    );
  }
}
