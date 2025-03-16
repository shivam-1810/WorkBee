import 'package:flutter/material.dart';
import 'package:workbee/home/available_works_page.dart';
import 'package:workbee/home/components/build_work_card.dart';

Widget buildSection(BuildContext context, String title) {
  final ScrollController scrollController = ScrollController();

  return Stack(
    children: [
      Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Row without the arrow
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AvailableWorksPage()));
                  }, // Handle 'View More' action
                  child: const Text(
                    'View More >',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Horizontal Scrollable Cards
            SizedBox(
              height: 170,
              child: ListView.builder(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return buildWorkCard(
                    title: "Graphic Designer",
                    description: "Create modern logos and branding...",
                    location: "New York, USA",
                    price: "\$100",
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // Floating Scroll Arrow
      Positioned(
        top: 125,
        right: 10,
        child: GestureDetector(
          onTap: () {
            scrollController.animateTo(
              scrollController.offset + 200,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  blurRadius: 4,
                  spreadRadius: 2,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black87,
              size: 20,
            ),
          ),
        ),
      ),
    ],
  );
}
