import 'package:flutter/material.dart';

class ManageCoinsPage extends StatefulWidget {
  const ManageCoinsPage({super.key});

  @override
  _ManageCoinsPageState createState() => _ManageCoinsPageState();
}

class _ManageCoinsPageState extends State<ManageCoinsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1D1D1F),
        title: const Text(
          "Manage Coins",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 24, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
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
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),

                // Coin Balance Section
                _buildCoinBalanceSection(),

                const SizedBox(height: 30),

                // Withdraw Coins Section
                _buildActionSection(
                  imagePath: 'assets/images/withdraw.png',
                  title: "Withdraw Coins",
                  subtitle: "1 Coin = 1 Rupee",
                  buttonText: "Withdraw Coins",
                  onPressed: () {},
                  isImageLeft: false,
                ),

                const SizedBox(height: 30),

                // Add Coins Section
                _buildActionSection(
                  imagePath: 'assets/images/add_coin.png',
                  title: "Add Coins",
                  subtitle: "Increase your coin balance",
                  buttonText: "Add Coins",
                  onPressed: () {},
                  isImageLeft: true,
                ),

                const SizedBox(height: 30),

                // Coin History Section
                _buildHistorySection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Coin Balance Section
  Widget _buildCoinBalanceSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/images/coin1.png',
            width: 130,
            height: 130,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Currently, you have",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "150 Coins",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 219, 180, 7),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Action Section (Withdraw/Add Coins)
  Widget _buildActionSection({
    required String imagePath,
    required String title,
    required String subtitle,
    required String buttonText,
    required VoidCallback onPressed,
    required bool isImageLeft,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          if (isImageLeft)
            Image.asset(
              imagePath,
              width: 150,
              height: 150,
            ),
          if (isImageLeft) const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1D1D1F),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 4,
                  ),
                  child: Text(
                    buttonText,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (!isImageLeft) const SizedBox(width: 16),
          if (!isImageLeft)
            Image.asset(
              imagePath,
              width: 160,
              height: 160,
            ),
        ],
      ),
    );
  }

  // Coin History Section
  Widget _buildHistorySection() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Coin History",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 10),
          _buildHistoryList(),
        ],
      ),
    );
  }

  // Coin History List
  Widget _buildHistoryList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Icon(Icons.history, color: Colors.teal, size: 28),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Transaction ${index + 1}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    "Coins: +10 | Date: 2025-03-12",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
