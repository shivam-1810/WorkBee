import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';

import 'package:workbee/home/navigation_menu.dart';

class ViewProfile extends StatefulWidget {
  const ViewProfile({super.key});

  @override
  _ViewProfileState createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  File? _image;

  final String name = "Sehaj";
  final String bio = "UI/UX Designer & Developer";
  final String mobile = "+91 9876543210";
  final String email = "sehaj@example.com";
  final String location = "Chandigarh, India";
  final String instagram = "sehaj._.bansal";

  final double rating = 4.5;
  final int numberOfRaters = 120;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Color(0xFF232526),
        elevation: 0,
        title: Text(
          "Profile",
          style: GoogleFonts.poppins(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
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
              // Profile Picture
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
                        ],
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
                    padding: EdgeInsets.all(6),
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
                ],
              ),
              SizedBox(height: 20),

              // Rating Section
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 28),
                  SizedBox(width: 6),
                  Text(
                    "$rating",
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: 6),
                  Text(
                    "($numberOfRaters ratings)",
                    style: GoogleFonts.poppins(color: Colors.grey[700]),
                  ),
                ],
              ),
              SizedBox(height: 30),

              // Profile Info Card
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.white, Color(0xFFF5F7FA)],
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
                    _buildStaticField(Icons.person, "Name", name),
                    _buildStaticField(Icons.work, "Bio", bio),
                    _buildStaticField(Icons.phone, "Mobile", mobile),
                    _buildStaticField(Icons.email, "Email", email),
                    _buildStaticField(Icons.location_on, "Location", location),
                    _buildStaticField(Icons.camera_alt, "Instagram", instagram),
                  ],
                ),
              ),
              SizedBox(height: 40),

              // Chat Button
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ChatPage()));
                },
                icon: Icon(Icons.chat_bubble_outline, color: Colors.white),
                label: Text(
                  "Chat Now",
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF232526),
                  padding: EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 5,
                  shadowColor: Colors.black26,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStaticField(IconData icon, String label, String value) {
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
          width: double.infinity,
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
          child: Text(
            value,
            style: GoogleFonts.poppins(fontSize: 16, color: Colors.black87),
          ),
        ),
        SizedBox(height: 14),
      ],
    );
  }
}
