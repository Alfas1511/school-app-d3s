import "package:flutter/material.dart";
import "package:school_app/views/home_page.dart";

class TransportPage extends StatefulWidget {
  const TransportPage({super.key});

  @override
  State<TransportPage> createState() => _TransportPageState();
}

class _TransportPageState extends State<TransportPage> {
  bool _gpsTrackingToggle = false; // initial state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFFF7043), // deep orange
                Color(0xFFF4511E), // darker orange
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const HomePage()),
          ),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Transport",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              "Emma Johnson - Route A",
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Live Tracking Section
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // Header row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Live Tracking",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          children: [
                            const Text(
                              "GPS",
                              style: TextStyle(color: Colors.black54),
                            ),
                            const SizedBox(width: 6),
                            Switch(
                              value: _gpsTrackingToggle,
                              activeColor: _gpsTrackingToggle
                                  ? Colors.green
                                  : Colors.red,
                              // onChanged: (val) {},
                              onChanged: (value) {
                                setState(() {
                                  _gpsTrackingToggle = value;
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      _gpsTrackingToggle
                                          ? "Tracking Enabled"
                                          : "Tracking Disabled",
                                    ),
                                    duration: const Duration(seconds: 2),
                                    backgroundColor: _gpsTrackingToggle
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Map Placeholder
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Icon(Icons.map, color: Colors.grey, size: 60),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Bus Card
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.green.withOpacity(0.1),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Icon(
                                  Icons.directions_bus,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "BUS-042",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    "Oak Street & 5th Avenue",
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Text(
                                "On Time",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "ETA: 8:15 AM",
                                style: TextStyle(color: Colors.black54),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bus Info Section
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Bus Information",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),

                    _buildInfoRow("Bus Number", "BUS-042"),
                    _buildInfoRow("Route", "Route A - Downtown"),
                    _buildInfoRow("Driver", "John Williams"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Contact",
                          style: TextStyle(color: Colors.black54),
                        ),
                        Row(
                          children: const [
                            Text(
                              "+1 555-0123",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 8),
                            Icon(Icons.call, color: Colors.green),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Recent Trips",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),

                    Card(
                      color: Colors.green[100],
                      child: ListTile(
                        leading: Icon(Icons.calendar_month),
                        title: Text("15/3/2024"),
                        subtitle: Text("7:45 AM - 8:20 AM"),
                        trailing: Text(
                          "Completed",
                          style: TextStyle(color: Colors.green[800]),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.green[100],
                      child: ListTile(
                        leading: Icon(Icons.calendar_month),
                        title: Text("15/3/2024"),
                        subtitle: Text("7:45 AM - 8:20 AM"),
                        trailing: Text(
                          "Completed",
                          style: TextStyle(color: Colors.green[800]),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.green[100],
                      child: ListTile(
                        leading: Icon(Icons.calendar_month),
                        title: Text("15/3/2024"),
                        subtitle: Text("7:45 AM - 8:20 AM"),
                        trailing: Text(
                          "Completed",
                          style: TextStyle(color: Colors.green[800]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Notifications
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Notifications",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),

                    Card(
                      color: Colors.green[100],
                      child: ListTile(
                        leading: Icon(Icons.notifications),
                        title: Text("Bus Delay Alert"),
                        subtitle: Text(
                          "Your bus in running 5 minutes late due to traffic",
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.green[100],
                      child: ListTile(
                        leading: Icon(Icons.check),
                        title: Text("Safe Arrival"),
                        subtitle: Text("Emma has arrived safely at school"),
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

  // Reusable info row
  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.black54)),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
