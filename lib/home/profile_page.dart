import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 234, 234, 234),
            Color.fromARGB(255, 206, 206, 206),
          ],
        ),
      ),
      child: Stack(
        children: [
          // Custom Curvy Background
          Positioned.fill(
            child: CustomPaint(
              painter: CurvedBackgroundPainter(),
            ),
          ),

          Column(
            children: [
              const SizedBox(height: 60),

              // Profile Content (Avatar, Name, Email)
              Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 70,
                      color: Colors.teal.shade700,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Shivam",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "shivam@example.com",
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              ),

              const SizedBox(height: 65),

              // Profile Options List
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    _buildOption(
                        Icons.person, "Your Profile", Colors.teal.shade700),
                    _buildOption(
                        Icons.work, "Completed Works", Colors.orange.shade700),
                    _buildOption(
                        Icons.create, "Created Works", Colors.purple.shade700),
                    _buildOption(Icons.account_balance_wallet, "Manage Coins",
                        Colors.blue.shade700),
                    _buildOption(Icons.mail, "Contact Us", Colors.red.shade700),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Profile Option Item
  Widget _buildOption(IconData icon, String title, Color color) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: color, size: 28),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing:
            const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
      ),
    );
  }
}

// Custom Painter for Curvy Background
class CurvedBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..shader = LinearGradient(
        colors: [
          const Color.fromARGB(255, 81, 148, 122),
          const Color.fromARGB(255, 78, 110, 109),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height * 0.3)
      ..quadraticBezierTo(
          size.width * 0.5, size.height * 0.375, size.width, size.height * 0.3)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
