import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:workbee/home/home_page.dart';
import 'package:workbee/home/profile_options.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _currentPageIndex = 1; // Default to Home Page (middle item)

  // Placeholder pages for Chat, Home, and Profile
  final List<Widget> _pages = [
    const ChatPage(), // Chat Page
    const HomePage(), // Home Page
    const ProfileOptions(), // Profile Page
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 234, 234, 234),
              Color.fromARGB(255, 206, 206, 206),
            ], // Softer blend
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: _pages[_currentPageIndex],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor:
            Color.fromARGB(255, 206, 206, 206), // Transparent background
        color: Color.fromARGB(255, 49, 51, 53),
        buttonBackgroundColor: Color.fromARGB(255, 43, 44, 46),
        height: 60,
        index: _currentPageIndex,
        onTap: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        items: const [
          Icon(Icons.chat_rounded, color: Colors.white), // Chat Page Icon
          Icon(Icons.home, color: Colors.white), // Home Page Icon
          Icon(Icons.person, color: Colors.white), // Profile Page Icon
        ],
      ),
    );
  }
}

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Chat Page',
        style: TextStyle(color: Colors.black, fontSize: 24),
      ),
    );
  }
}
