import 'package:flutter/material.dart';
import 'package:workbee/home/contact_us_page.dart';
import 'package:workbee/home/manage_coins_page.dart';
import 'package:workbee/home/your_profile_page.dart';

class ProfileOptions extends StatelessWidget {
  const ProfileOptions({super.key});

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
          Positioned.fill(
            child: CustomPaint(
              painter: CurvedBackgroundPainter(),
            ),
          ),
          Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.08),
              CircleAvatar(
                radius: 65,
                backgroundColor:
                    const Color.fromARGB(255, 150, 150, 150).withOpacity(0.6),
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 70,
                    color: Colors.black.withOpacity(0.9),
                  ),
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
              const SizedBox(height: 2),
              const Text(
                "shivam@example.com",
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.105),
              Expanded(
                child: Navigator(
                  onGenerateRoute: (settings) {
                    return MaterialPageRoute(
                      builder: (context) => _buildOptionsList(context),
                    );
                  },
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOptionsList(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        _buildOption(context, Icons.person, "Your Profile",
            [Colors.blueGrey.shade200, Colors.blueGrey.shade500]),
        _buildOption(context, Icons.work, "Completed Works",
            [Colors.teal.shade100, Colors.teal.shade300]),
        _buildOption(context, Icons.create, "Created Works",
            [Colors.indigo.shade100, Colors.indigo.shade300]),
        _buildOption(context, Icons.account_balance_wallet, "Manage Coins",
            [const Color.fromARGB(255, 239, 222, 194), Colors.orange.shade200]),
        _buildOption(context, Icons.mail, "Contact Us", [
          Colors.blueAccent.shade100,
          const Color.fromARGB(255, 63, 131, 248)
        ]),
      ],
    );
  }

  Widget _buildOption(
      BuildContext context, IconData icon, String title, List<Color> colors) {
    return GestureDetector(
      onTap: () {
        if (title == "Contact Us") {
          Navigator.of(context, rootNavigator: true).push(
            MaterialPageRoute(
              builder: (context) => ContactUsPage(),
            ),
          );
        } else if (title == "Manage Coins") {
          Navigator.of(context, rootNavigator: true).push(
            MaterialPageRoute(
              builder: (context) => ManageCoinsPage(),
            ),
          );
        } else if (title == "Your Profile") {
          Navigator.of(context, rootNavigator: true).push(
            MaterialPageRoute(
              builder: (context) => YourProfilePage(),
            ),
          );
        } else {
          print("No action defined for $title");
        }
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 15),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: colors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: Colors.black54, size: 28),
            ),
            title: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios,
                size: 18, color: Colors.black54),
          ),
        ),
      ),
    );
  }
}

class CurvedBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..shader = LinearGradient(
        colors: [
          Color.fromARGB(255, 63, 63, 64),
          Color.fromARGB(255, 24, 24, 25)
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    double curveHeight = size.height * 0.375; // Reduced for better fit

    Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, curveHeight)
      ..quadraticBezierTo(size.width * 0.5, curveHeight + (size.height * 0.08),
          size.width, curveHeight)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
