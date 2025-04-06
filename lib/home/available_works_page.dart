import 'package:flutter/material.dart';
import 'package:workbee/home/job_details_screen.dart';

class AvailableWorksPage extends StatefulWidget {
  const AvailableWorksPage({super.key});

  @override
  _AvailableWorksPageState createState() => _AvailableWorksPageState();
}

class _AvailableWorksPageState extends State<AvailableWorksPage> {
  final List<Map<String, dynamic>> allWorks = [
    {
      'title': 'Graphic Designer',
      'description': 'Create modern logos and branding...',
      'location': 'New York, USA',
      'price': 100,
      'uploader': 'Sehaj',
      'avatarUrl': 'https://randomuser.me/api/portraits/men/1.jpg',
      'type': 'Design',
      'experience': 'Intermediate',
      'postedDate': DateTime.now().subtract(const Duration(days: 1)),
    },
    {
      'title': 'UI/UX Designer',
      'description': 'Design user-friendly mobile apps...',
      'location': 'San Francisco, USA',
      'price': 150,
      'uploader': 'Sehaj',
      'avatarUrl': 'https://randomuser.me/api/portraits/men/1.jpg',
      'type': 'Design',
      'experience': 'Senior',
      'postedDate': DateTime.now().subtract(const Duration(days: 3)),
    },
    {
      'title': 'Web Developer',
      'description': 'Develop responsive websites...',
      'location': 'Los Angeles, USA',
      'price': 200,
      'uploader': 'Sehaj',
      'avatarUrl': 'https://randomuser.me/api/portraits/men/1.jpg',
      'type': 'Development',
      'experience': 'Junior',
      'postedDate': DateTime.now().subtract(const Duration(days: 5)),
    },
    {
      'title': 'Mobile Developer',
      'description': 'Build cross-platform mobile apps...',
      'location': 'Shenzhen, China',
      'price': 180,
      'uploader': 'Sehaj',
      'avatarUrl': 'https://randomuser.me/api/portraits/men/1.jpg',
      'type': 'Development',
      'experience': 'Intermediate',
      'postedDate': DateTime.now().subtract(const Duration(days: 2)),
    },
    {
      'title': 'Data Analyst',
      'description': 'Analyze business data and trends...',
      'location': 'Shanghai, China',
      'price': 220,
      'uploader': 'Sehaj',
      'avatarUrl': 'https://randomuser.me/api/portraits/men/1.jpg',
      'type': 'Analytics',
      'experience': 'Senior',
      'postedDate': DateTime.now().subtract(const Duration(days: 4)),
    },
  ];

  final Set<int> appliedJobs = {};
  List<Map<String, dynamic>> filteredWorks = [];
  String? selectedLocation;
  String? selectedType;
  String? selectedExperience;
  String sortBy = 'Newest';
  bool showFilters = false;

  @override
  void initState() {
    super.initState();
    filteredWorks = List.from(allWorks);
    _sortWorks();
  }

  void _filterWorks() {
    setState(() {
      filteredWorks = allWorks.where((work) {
        final locationMatch =
            selectedLocation == null || work['location'] == selectedLocation;
        final typeMatch = selectedType == null || work['type'] == selectedType;
        final experienceMatch = selectedExperience == null ||
            work['experience'] == selectedExperience;
        return locationMatch && typeMatch && experienceMatch;
      }).toList();
      _sortWorks();
    });
  }

  void _sortWorks() {
    setState(() {
      switch (sortBy) {
        case 'Newest':
          filteredWorks
              .sort((a, b) => b['postedDate'].compareTo(a['postedDate']));
          break;
        case 'Oldest':
          filteredWorks
              .sort((a, b) => a['postedDate'].compareTo(b['postedDate']));
          break;
        case 'Price: High to Low':
          filteredWorks.sort((a, b) => b['price'].compareTo(a['price']));
          break;
        case 'Price: Low to High':
          filteredWorks.sort((a, b) => a['price'].compareTo(b['price']));
          break;
      }
    });
  }

  void _resetFilters() {
    setState(() {
      selectedLocation = null;
      selectedType = null;
      selectedExperience = null;
      sortBy = 'Newest';
      filteredWorks = List.from(allWorks);
      _sortWorks();
    });
  }

  @override
  Widget build(BuildContext context) {
    final uniqueLocations = allWorks.map((e) => e['location']).toSet().toList();
    final uniqueTypes = allWorks.map((e) => e['type']).toSet().toList();
    final uniqueExperiences =
        allWorks.map((e) => e['experience']).toSet().toList();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: const Color(0xFF232526),
        elevation: 0,
        title: const Text(
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
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(
              showFilters ? Icons.close : Icons.filter_alt,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                showFilters = !showFilters;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          if (showFilters) ...[
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Filter Options',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildFilterDropdown(
                    label: 'Location',
                    value: selectedLocation,
                    items: uniqueLocations,
                    onChanged: (value) {
                      setState(() {
                        selectedLocation = value;
                      });
                    },
                  ),
                  _buildFilterDropdown(
                    label: 'Job Type',
                    value: selectedType,
                    items: uniqueTypes,
                    onChanged: (value) {
                      setState(() {
                        selectedType = value;
                      });
                    },
                  ),
                  _buildFilterDropdown(
                    label: 'Experience Level',
                    value: selectedExperience,
                    items: uniqueExperiences,
                    onChanged: (value) {
                      setState(() {
                        selectedExperience = value;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: _resetFilters,
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            side: BorderSide(color: Colors.grey[400]!),
                          ),
                          child: const Text('Reset Filters'),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            _filterWorks();
                            setState(() {
                              showFilters = false;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF232526),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: const Text(
                            'Apply Filters',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(color: Colors.grey[300]!),
                ),
              ),
              child: Row(
                children: [
                  const Text(
                    'Sort by:',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 8),
                  DropdownButton<String>(
                    value: sortBy,
                    underline: Container(),
                    items: [
                      'Newest',
                      'Oldest',
                      'Price: High to Low',
                      'Price: Low to High',
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        sortBy = value!;
                        _sortWorks();
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
          Expanded(
            child: Container(
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
                  padding: const EdgeInsets.all(16.0),
                  child: filteredWorks.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.search_off,
                                  size: 48, color: Colors.grey[400]),
                              const SizedBox(height: 16),
                              Text(
                                'No jobs match your filters',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(height: 8),
                              TextButton(
                                onPressed: _resetFilters,
                                child: const Text('Reset filters'),
                              ),
                            ],
                          ),
                        )
                      : ListView.separated(
                          itemCount: filteredWorks.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 10),
                          itemBuilder: (context, index) {
                            final work = filteredWorks[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const JobDetailScreen(),
                                ));
                              },
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color.fromARGB(
                                              255, 147, 147, 147)
                                          .withOpacity(0.2),
                                      blurRadius: 6,
                                      spreadRadius: 2,
                                      offset: const Offset(0, 3),
                                    )
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      work['title'],
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 16,
                                          backgroundImage:
                                              NetworkImage(work['avatarUrl']),
                                          backgroundColor: Colors.grey[300],
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          'Uploaded by: ${work['uploader']}',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      work['description'],
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.location_on,
                                                    size: 18,
                                                    color: Colors.blue),
                                                const SizedBox(width: 5),
                                                Text(work['location']),
                                              ],
                                            ),
                                            const SizedBox(height: 5),
                                            Row(
                                              children: [
                                                Icon(Icons.work_outline,
                                                    size: 18,
                                                    color: Colors.blue),
                                                const SizedBox(width: 5),
                                                Text(work['type']),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              '\$${work['price']}',
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.green,
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            ElevatedButton(
                                              onPressed: appliedJobs
                                                      .contains(index)
                                                  ? null
                                                  : () {
                                                      setState(() {
                                                        appliedJobs.add(index);
                                                      });
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(SnackBar(
                                                              content: Text(
                                                                  'Applied for ${work['title']}')));
                                                    },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: appliedJobs
                                                        .contains(index)
                                                    ? const Color.fromARGB(
                                                        255, 87, 87, 87)
                                                    : const Color(0xFF232526),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                              child: Text(
                                                appliedJobs.contains(index)
                                                    ? 'Already Applied'
                                                    : 'Apply Now',
                                                style: TextStyle(
                                                    color: appliedJobs
                                                            .contains(index)
                                                        ? Colors.black
                                                        : Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                )),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterDropdown({
    required String label,
    required String? value,
    required List<dynamic> items,
    required Function(String?) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 4),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(8),
            ),
            child: DropdownButtonFormField<String>(
              value: value,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                border: InputBorder.none,
              ),
              items: [
                DropdownMenuItem(
                  value: null,
                  child:
                      Text('All $label', style: TextStyle(color: Colors.grey)),
                ),
                ...items.map((item) => DropdownMenuItem(
                      value: item,
                      child: Text(item.toString()),
                    )),
              ],
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
