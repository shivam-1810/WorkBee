import 'package:flutter/material.dart';

Widget buildCoinSection() {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 3,
          blurRadius: 6,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Title
        const Text(
          'Your Coins',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),

        const SizedBox(height: 16),

        // Row with text & image
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Text Section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'You currently have',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '150 Coins',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber.shade700,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Manage Coins Button
                  TextButton(
                    onPressed: () {
                      // Handle button press
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Manage Coins',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Icon(Icons.arrow_forward_ios,
                            size: 14, color: Colors.blue),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Coin Image
            Image.asset(
              'assets/images/coin.png',
              width: 120,
              height: 120,
            ),
          ],
        ),
      ],
    ),
  );
}
