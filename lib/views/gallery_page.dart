import 'package:flutter/material.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  String activites = "All Events";
  final List<String> days = [
    "All Events",
    "Sports Day",
    "Science Fair",
    "Cultural Activities",
    "Annual Day",
  ];

  final List<Map<String, dynamic>> galleryItems = [
    {
      "image": "https://picsum.photos/300/200?random=1",
      "title": "School Event",
      "description": "Annual science fair showcasing student projects",
      "date": "March 15, 2024",
    },
    {
      "image": "https://picsum.photos/300/200?random=2",
      "title": "Sports Day",
      "description": "Students participating in various athletic events",
      "date": "February 28, 2024",
    },
    {
      "image": "https://picsum.photos/300/200?random=3",
      "title": "Art Exhibition",
      "description": "Creative artworks by our talented students",
      "date": "January 20, 2024",
    },
    {
      "image": "https://picsum.photos/300/200?random=4",
      "title": "Music Concert",
      "description": "Annual music performance by school bands",
      "date": "December 15, 2023",
    },
    {
      "image": "https://picsum.photos/300/200?random=5",
      "title": "Field Trip",
      "description": "Students visiting the natural history museum",
      "date": "November 10, 2023",
    },
    {
      "image": "https://picsum.photos/300/200?random=6",
      "title": "Science Lab",
      "description": "Students conducting experiments in chemistry class",
      "date": "October 5, 2023",
    },
    {
      "image": "https://picsum.photos/300/200?random=7",
      "title": "Math Competition",
      "description": "School team winning regional mathematics olympiad",
      "date": "September 18, 2023",
    },
    {
      "image": "https://picsum.photos/300/200?random=8",
      "title": "Drama Club",
      "description": "Performance of Shakespeare's Macbeth",
      "date": "August 22, 2023",
    },
    {
      "image": "https://picsum.photos/300/200?random=9",
      "title": "Graduation Day",
      "description": "Class of 2023 graduation ceremony",
      "date": "June 10, 2023",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF6A11CB),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Gallery",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              "School Events & Activities",
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Day Selector
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 0,
                    blurRadius: 1,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Filter by Category",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: days.length,
                      itemBuilder: (context, index) {
                        final day = days[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: ChoiceChip(
                            label: Text(day),
                            selected: activites == day,
                            onSelected: (selected) {
                              setState(() {
                                activites = day;
                              });
                            },
                            selectedColor: const Color(0xFF6A11CB),
                            labelStyle: TextStyle(
                              color: activites == day
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Gallery grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.75,
              ),
              itemCount: galleryItems.length,
              itemBuilder: (context, index) {
                return _buildImageCard(galleryItems[index]);
              },
            ),

            SizedBox(height: 12),
            // Upcoming Events Section
            Padding(
              padding: EdgeInsets.all(12.00),
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Upcoming Events",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.science, color: Colors.blue),
                      title: Text(
                        "Spring Concert",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text("March 25, 2024 - Music performances"),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.sports_gymnastics,
                        color: Colors.blue,
                      ),
                      title: Text(
                        "Nature Walk",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "March 30, 2024 - Botanical garden Event visit",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildImageCard(Map<String, dynamic> item) {
  return GestureDetector(
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.network(
              item["image"],
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  height: 120,
                  width: double.infinity,
                  color: Colors.grey[200],
                  child: Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 120,
                  width: double.infinity,
                  color: Colors.grey[200],
                  child: const Icon(Icons.error, color: Colors.grey),
                );
              },
            ),
          ),

          // Content
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item["title"],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 4),

                Text(
                  item["description"],
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 8),

                Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      size: 14,
                      color: Colors.grey[600],
                    ),
                    const SizedBox(width: 4),
                    Text(
                      item["date"],
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
