// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:sample_app/components/home_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String name = "John";
  late String zone = "Z2";
  final String balance = "100";

  void _scanQRCode() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MobileScanner(
          onDetect: (BarcodeCapture barcodeCapture) {
            final List<Barcode> barcodes = barcodeCapture.barcodes;

            for (var barcode in barcodes) {
              if (barcode.rawValue != null) {
                setState(() {
                  zone = barcode.rawValue!;
                });
              }
            }
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home",
            style: GoogleFonts.modernAntiqua(color: Colors.brown[900])),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Hi, $name",
                style: GoogleFonts.modernAntiqua(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              )),
          HomeCard(heading: "Zone", value: zone),
          SizedBox(
            height: 15,
          ),
          HomeCard(heading: "Card", value: balance)
        ],
      ),
      floatingActionButton: SizedBox(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          onPressed: _scanQRCode,
          backgroundColor: Colors.amber[200],
          child: Icon(
            Icons.qr_code_scanner,
            size: 30,
            color: Colors.black,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
