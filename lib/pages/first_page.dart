// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:sample_app/pages/home_page.dart';
import 'package:sample_app/pages/payments_page.dart';
import 'package:sample_app/pages/profile_page.dart';
import 'package:sample_app/pages/sample.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int _current_page = 0;

  void updatePage(int index) {
    setState(() {
      _current_page = index;
    });
  }

  final List _pages = [MyHomePage(), ProfilePage(), PaymentsPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.green[900],
        //   elevation: 0,
        // ),
        body: _pages[_current_page],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _current_page,
          onTap: updatePage,
          selectedItemColor: Colors.brown[800],
          items: [
            //Home
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            //Profile
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
            //Payment
            BottomNavigationBarItem(
              icon: Icon(Icons.pedal_bike),
              label: "Payments",
            ),
          ],
        ));
  }
}
