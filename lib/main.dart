// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sample_app/pages/first_page.dart';
import 'package:sample_app/pages/home_page.dart';
import 'package:sample_app/pages/payments_page.dart';
import 'package:sample_app/pages/profile_page.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
      routes: {
        '/home_page': (context) => HomePage(),
        '/profile_page': (context) => ProfilePage(),
        '/payments_page': (context) => PaymentsPage(),
      },
      
    );
  }
}
