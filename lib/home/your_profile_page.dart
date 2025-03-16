import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class YourProfilePage extends StatefulWidget {
  @override
  _YourProfilePageState createState() => _YourProfilePageState();
}

class _YourProfilePageState extends State<YourProfilePage> {
  bool isEditing = false;
  File? _image;

  TextEditingController nameController = TextEditingController(text: "Sehaj");
  TextEditingController bioController =
      TextEditingController(text: "UI/UX Designer & Developer");
  TextEditingController mobileController =
      TextEditingController(text: "+91 9876543210");
  TextEditingController emailController =
      TextEditingController(text: "sehaj@example.com");
  TextEditingController locationController =
      TextEditingController(text: "Chandigarh, India");
  TextEditingController instaController =
      TextEditingController(text: "sehaj._.bansal");

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Color(0xFF232526),
        elevation: 0,
        title: Text(
          "My Profile",
          style: GoogleFonts.poppins(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon:
                Icon(isEditing ? Icons.check : Icons.edit, color: Colors.white),
            onPressed: () {
              setState(() {
                isEditing = !isEditing;
              });
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 234, 234, 234),
              Color.fromARGB(255, 206, 206, 206),
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              // Profile Picture with Gradient Border
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 234, 234, 234),
                          Color.fromARGB(255, 206, 206, 206),
                        ], // Purple to Blue
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(6), // Border width
                    child: CircleAvatar(
                      radius: 65,
                      backgroundColor: Colors.grey[200],
                      backgroundImage: _image != null
                          ? FileImage(_image!)
                          : NetworkImage(
                                  "https://randomuser.me/api/portraits/men/1.jpg")
                              as ImageProvider,
                    ),
                  ),
                  InkWell(
                    onTap: _pickImage,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 6,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Icon(Icons.edit, color: Colors.white, size: 20),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              // Profile Details Card
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white,
                      Color(0xFFF5F7FA)
                    ], // Soft white gradient
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 20,
                      spreadRadius: 5,
                      offset: Offset(0, 10),
                    )
                  ],
                ),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                child: Column(
                  children: [
                    _buildEditableField(Icons.person, "Name", nameController),
                    _buildEditableField(Icons.work, "Bio", bioController),
                    _buildEditableField(
                        Icons.phone, "Mobile", mobileController),
                    _buildEditableField(Icons.email, "Email", emailController),
                    _buildEditableField(
                        Icons.location_on, "Location", locationController),
                    _buildEditableField(
                        Icons.camera_alt, "Instagram", instaController),
                  ],
                ),
              ),
              SizedBox(height: 30),
              // Save Button
              if (isEditing)
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isEditing = false;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Profile updated successfully!")),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 5,
                    shadowColor: Colors.black26,
                  ),
                  child: Text("Save Details",
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditableField(
      IconData icon, String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.black, size: 24),
            SizedBox(width: 12),
            Text(label,
                style: GoogleFonts.poppins(
                    fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: isEditing
              ? TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                  ),
                  style: GoogleFonts.poppins(fontSize: 16, color: Colors.black),
                )
              : Text(
                  controller.text,
                  style:
                      GoogleFonts.poppins(fontSize: 16, color: Colors.black87),
                ),
        ),
        SizedBox(height: 14),
      ],
    );
  }
}
