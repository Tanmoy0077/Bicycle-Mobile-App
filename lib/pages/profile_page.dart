// // ignore_for_file: prefer_const_constructors

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   String name = "John Doe";
//   String phoneNumber = "123-456-7890";
//   String email = "john.doe@example.com";
//   File? profileImage;

//   final ImagePicker _picker = ImagePicker();

//   Future<void> _pickImage() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         profileImage = File(pickedFile.path);
//       });
//     }
//   }

//   void _editDetails() {
//     // Implement logic to edit details
//     // For simplicity, we'll use a dialog to take new values
//     showDialog(
//       context: context,
//       builder: (context) {
//         String newName = name;
//         String newPhone = phoneNumber;
//         String newEmail = email;

//         return AlertDialog(
//           title: Text("Edit Details"),
//           content: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 decoration: InputDecoration(labelText: "Name"),
//                 onChanged: (value) {
//                   newName = value;
//                 },
//                 controller: TextEditingController(text: name),
//               ),
//               TextField(
//                 decoration: InputDecoration(labelText: "Phone Number"),
//                 onChanged: (value) {
//                   newPhone = value;
//                 },
//                 controller: TextEditingController(text: phoneNumber),
//               ),
//               TextField(
//                 decoration: InputDecoration(labelText: "Email"),
//                 onChanged: (value) {
//                   newEmail = value;
//                 },
//                 controller: TextEditingController(text: email),
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 setState(() {
//                   name = newName;
//                   phoneNumber = newPhone;
//                   email = newEmail;
//                 });
//                 Navigator.of(context).pop();
//               },
//               child: Text("Save"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(children: [
//         SizedBox(
//           height: 200,
//         ),
//         Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               GestureDetector(
//                 onTap: _pickImage,
//                 child: CircleAvatar(
//                   radius: 50,
//                   backgroundImage: profileImage != null
//                       ? FileImage(profileImage!)
//                       : AssetImage('lib/assets/images/default_avatar.png')
//                           as ImageProvider,
//                   child: profileImage == null
//                       ? Icon(Icons.add_a_photo, size: 25)
//                       : null,
//                 ),
//               ),
//               SizedBox(height: 16),
//               Text("Name: $name"),
//               SizedBox(height: 8),
//               Text("Phone: $phoneNumber"),
//               SizedBox(height: 8),
//               Text("Email: $email"),
//               SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: _editDetails,
//                 child: Text("Edit Details"),
//               ),
//             ],
//           ),
//         ),
//       ]),
//     );
//   }
// }

// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = "John Doe";
  String phoneNumber = "123-456-7890";
  String email = "john.doe@example.com";
  File? profileImage;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        profileImage = File(pickedFile.path);
      });
    }
  }

  void _editDetails() {
    // Implement logic to edit details
    // For simplicity, we'll use a dialog to take new values
    showDialog(
      context: context,
      builder: (context) {
        String newName = name;
        String newPhone = phoneNumber;
        String newEmail = email;

        return AlertDialog(
          title: Text("Edit Details"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: "Name"),
                onChanged: (value) {
                  newName = value;
                },
                controller: TextEditingController(text: name),
              ),
              TextField(
                decoration: InputDecoration(labelText: "Phone Number"),
                onChanged: (value) {
                  newPhone = value;
                },
                controller: TextEditingController(text: phoneNumber),
              ),
              TextField(
                decoration: InputDecoration(labelText: "Email"),
                onChanged: (value) {
                  newEmail = value;
                },
                controller: TextEditingController(text: email),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  name = newName;
                  phoneNumber = newPhone;
                  email = newEmail;
                });
                Navigator.of(context).pop();
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, 
        title: Text("Profile"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: profileImage != null
                    ? FileImage(profileImage!)
                    : AssetImage('lib/assets/images/default_avatar.png')
                        as ImageProvider,
                child: profileImage == null
                    ? Icon(Icons.add_a_photo, size: 25)
                    : null,
              ),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Name:",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          name,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Phone:",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          phoneNumber,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Email:",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          email,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _editDetails,
              child: Text("Edit Details"),
            ),
          ],
        ),
      ),
    );
  }
}