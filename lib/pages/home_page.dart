// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String name = "John";
  late String zone = "A2";
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
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => HomePage()),
            // ); // Close scanner after scan
          },
        ),
      ),
    );
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: DecoratedBox(
          decoration: BoxDecoration(
            // image: DecorationImage(
            //   image: AssetImage("lib/assets/images/mount.jpg"),
            //   fit: BoxFit.cover,
            // ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 25),
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Hey there, $name",
                      style: GoogleFonts.lato(
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 200,
                    width: 180,
                    decoration: BoxDecoration(
                      color: Colors.teal.shade900,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.all(25),
                    child: Column(
                      children: [
                        Text(
                          "Zone",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Times New Roman"),
                          textAlign: TextAlign.center,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            zone,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Times New Roman"),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 200,
                    width: 180,
                    decoration: BoxDecoration(
                        color: Colors.cyan.shade900,
                        borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.all(25),
                    child: Column(
                      children: [
                        Text(
                          "Card",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Times New Roman"),
                          textAlign: TextAlign.center,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            balance,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Times New Roman"),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 195,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: ButtonTheme(
                      minWidth: 100,
                      height: 30,
                      child: ElevatedButton.icon(
                        onPressed: _scanQRCode,
                        icon: Icon(Icons.add),
                        label: Text(
                          "Scan Bicycle",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal.shade900,
                          iconColor: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
