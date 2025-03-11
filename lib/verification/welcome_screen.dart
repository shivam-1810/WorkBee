import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workbee/verification/register_screen.dart';
import 'package:workbee/verification/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top Background Image with Fade Effect
          Expanded(
            flex: 3, // Increased flex to take more space
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          "assets/images/welcome.jpg"), // Background image
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Fade effect
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 120, // Adjust fade height
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.white,
                            Colors.white.withOpacity(0),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Transform.translate(
            offset: const Offset(0, -40), // Move text up by 50 pixels
            child: Expanded(
              flex: 2, // Adjusted flex for balance
              child: Container(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Logo
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.transparent,
                      backgroundImage:
                          AssetImage("assets/images/logo.png"), // App logo
                    ),
                    Transform.translate(
                      offset: Offset(0, -25), // Move text up by 10 pixels
                      child: Text(
                        "WorkBee",
                        style: GoogleFonts.poppins(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(0, -25), // Move text up by 10 pixels
                      child: Text(
                        "Buzz your task, get it done!",
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Login Button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                        },
                        child: const Text("Login",
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Register Button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.black),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => RegisterScreen()));
                        },
                        child: const Text("Register",
                            style:
                                TextStyle(fontSize: 18, color: Colors.black)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
