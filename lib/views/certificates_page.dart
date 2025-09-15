import 'package:flutter/material.dart';

class CertificatesPage extends StatefulWidget {
  const CertificatesPage({super.key});

  @override
  State<CertificatesPage> createState() => _CertificatesPageState();
}

class _CertificatesPageState extends State<CertificatesPage> {
  String selectedChild = "Emma Johnson - Grade 5A";
  final List<String> children = [
    "Emma Johnson - Grade 5A",
    "James Johnson - Grade 4B"
  ];

  final List<Map<String, dynamic>> certificates = [
    {
      "title": "Academic Excellence Award",
      "subtitle": "Achievement Certificate",
      "status": "Available",
      "date": "2024-01-15"
    },
    {
      "title": "Good Conduct Certificate",
      "subtitle": "Character Certificate",
      "status": "Available",
      "date": "2024-01-10"
    },
    {
      "title": "School Transfer Certificate",
      "subtitle": "Transfer Certificate",
      "status": "Processing",
      "date": "2024-01-20"
    },
    {
      "title": "Sports Day Winner",
      "subtitle": "Achievement Certificate",
      "status": "Available",
      "date": "2024-01-20"
    },
    {
      "title": "Leadership Award",
      "subtitle": "Character Certificate",
      "status": "Available",
      "date": "2024-01-20"
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
              "Certificates",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              "Download and manage certificates",
              style: TextStyle(color: Colors.white70, fontSize: 18),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Child Dropdown
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Align(alignment: Alignment.topLeft,child: Text("Select Child", style: TextStyle(fontWeight: FontWeight.bold),)),
                  DropdownButton<String>(
                    value: selectedChild,
                    isExpanded: true,
                    underline: const SizedBox(),
                    items: children
                        .map((child) => DropdownMenuItem(
                      value: child,
                      child: Text(child),
                    ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedChild = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Stats Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatCard("8", "Total\nCertificates", Colors.blue),
                _buildStatCard("6", "Available", Colors.green),
                _buildStatCard("2", "Processing", Colors.orange),
              ],
            ),
            const SizedBox(height: 20),

            // Available Certificates Title
            // Available Certificates Title
            const Text(
              "Available Certificates",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Certificates List
            Column(
              children: certificates.map((cert) {
                return _buildCertificateCard(
                  cert["title"],
                  cert["subtitle"],
                  cert["status"],
                  cert["date"],
                );
              }).toList(),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.blue[100],
              ),

              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 20),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text("Need a new certificate?", style: TextStyle(fontWeight: FontWeight.bold),)),
                    SizedBox(height: 8,),
                    Text("Request additional certificates from the school administration"),
                    SizedBox(height: 8,),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          backgroundColor: Colors.blue,
                        ),
                        onPressed: () {},
                        child: const Text("Request Certificate",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                      ),
                    ),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String number, String label, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(number,
              style: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold, color: color)),
          const SizedBox(height: 6),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 13, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  Widget _buildCertificateCard(
      String title, String subtitle, String status, String date) {
    Color statusColor =
    status == "Available" ? Colors.green : Colors.orange;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.emoji_events, color: Colors.amber, size: 32),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15)),
                Text(subtitle,
                    style: const TextStyle(color: Colors.grey, fontSize: 13)),
                const SizedBox(height: 6),
                Text("Issued: $date",
                    style: const TextStyle(
                        color: Colors.black54, fontSize: 12)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  status,
                  style: TextStyle(color: statusColor, fontSize: 12),
                ),
              ),
              const SizedBox(height: 6),
              if (status == "Available")
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6A11CB),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 6),
                    textStyle: const TextStyle(fontSize: 12),
                  ),
                  child: const Text("Download", style: TextStyle(color: Colors.white),),
                ),
            ],
          )
        ],
      ),
    );
  }
}
