import 'package:flutter/material.dart';

class AvailableWorksPage extends StatelessWidget {
  final List<Map<String, dynamic>> works = [
    {
      'title': 'Graphic Designer',
      'description': 'Create modern logos and branding...',
      'location': 'New York, USA',
      'price': '\$100',
      'uploader': 'Sehaj',
      'avatarUrl': 'https://randomuser.me/api/portraits/men/1.jpg'
    },
    {
      'title': 'UI/UX Designer',
      'description': 'Design user-friendly mobile apps...',
      'location': 'San Francisco, USA',
      'price': '\$150',
      'uploader': 'Sehaj',
      'avatarUrl': 'https://randomuser.me/api/portraits/men/1.jpg'
    },
    {
      'title': 'Web Developer',
      'description': 'Develop responsive websites...',
      'location': 'Los Angeles, USA',
      'price': '\$200',
      'uploader': 'Sehaj',
      'avatarUrl': 'https://randomuser.me/api/portraits/men/1.jpg'
    },
    {
      'title': 'Web Developer',
      'description': 'Develop responsive websites...',
      'location': 'Shenzhen, China',
      'price': '\$200',
      'uploader': 'Sehaj',
      'avatarUrl': 'https://randomuser.me/api/portraits/men/1.jpg'
    },
    {
      'title': 'Web Developer',
      'description': 'Develop responsive websites...',
      'location': 'Shanghai, China',
      'price': '\$200',
      'uploader': 'Sehaj',
      'avatarUrl': 'https://randomuser.me/api/portraits/men/1.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Color(0xFF232526),
        elevation: 0,
        title: Text(
          'Available Works',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        height: double.infinity,
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.separated(
            itemCount: works.length,
            separatorBuilder: (context, index) => SizedBox(height: 10),
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(16),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 147, 147, 147)
                          .withOpacity(0.2),
                      blurRadius: 6,
                      spreadRadius: 2,
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      works[index]['title'],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 16, // Small size avatar
                          backgroundImage: NetworkImage(
                              works[index]['avatarUrl']), // Load from URL
                          backgroundColor:
                              Colors.grey[300], // Placeholder color
                        ),
                        SizedBox(width: 8), // Space between avatar and text
                        Text(
                          'Uploaded by: ${works[index]['uploader']}',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(
                      works[index]['description'],
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.location_on,
                                    size: 18, color: Colors.blue),
                                SizedBox(width: 5),
                                Text(works[index]['location']),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.end, // Align to right
                              children: [
                                const SizedBox(width: 5),
                                Text(
                                  works[index]['price'],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                                height: 8), // Space between price and button
                            ElevatedButton(
                              onPressed: () {
                                // TODO: Implement Apply Now functionality
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                        'Applied for ${works[index]['title']}')));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color(0xFF232526), // Button color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text(
                                'Apply Now',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
