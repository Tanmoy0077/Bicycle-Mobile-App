// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sample_app/components/profile_textfield.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = "John Doe";
  String phoneNumber = "123-456-7890";
  String email = "john.doe@example.com";
  File? profileImage;
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        profileImage = File(pickedFile.path);
      });
    }
  }

  bool isEditable = false;

  void toggleEdit() {
    if (isEditable) {
      // Update variables with current text field values when saving
      setState(() {
        name = nameController.text;
        phoneNumber = phoneController.text;
        email = emailController.text;
        isEditable = false;
      });
    } else {
      isEditable = true;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    nameController.text = name;
    phoneController.text = phoneNumber;
    emailController.text = email;
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
      body: ListView(padding: const EdgeInsets.all(16.0), children: [
        Column(
          children: [
            SizedBox(height: 20),
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 70,
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
            ProfileTextfield(
                controller: nameController,
                hintText: name,
                obscureText: false,
                icon: Icon(Icons.person_4_rounded),
                editable: !isEditable),
            SizedBox(height: 20),
            ProfileTextfield(
                controller: phoneController,
                hintText: phoneNumber,
                obscureText: false,
                icon: Icon(Icons.call),
                editable: !isEditable),
            SizedBox(height: 20),
            ProfileTextfield(
                controller: emailController,
                hintText: email,
                obscureText: false,
                icon: Icon(Icons.email),
                editable: !isEditable),
            SizedBox(height: 20),
          ],
        ),
      ]),
      floatingActionButton: SizedBox(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          onPressed: _editDetails,
          backgroundColor: Colors.amber[200],
          child: isEditable ? Icon(
            Icons.save,
            size: 30,
            color: Colors.brown[900],
          ):
          Icon(
            Icons.edit,
            size: 30,
            color: Colors.brown[900],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
