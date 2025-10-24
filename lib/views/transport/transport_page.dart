import "package:flutter/material.dart";
import "package:school_app/core/constants/api_constants.dart";
import "package:school_app/core/services/api_service.dart";
import "package:school_app/models/bus_notifications_model.dart";
import "package:school_app/models/bus_recent_trips_model.dart";
import "package:school_app/models/student_bus_information_model.dart";
import "package:school_app/views/transport/bus_information_card.dart";
import "package:school_app/views/transport/bus_notifications_card.dart";
import "package:school_app/views/transport/recent_trips_card.dart";
import "package:shared_preferences/shared_preferences.dart";

class TransportPage extends StatefulWidget {
  const TransportPage({super.key});

  @override
  State<TransportPage> createState() => _TransportPageState();
}

class _TransportPageState extends State<TransportPage> {
  bool _gpsTrackingToggle = false; // initial state
  bool isLoading = true;
  String studentName = '';
  StudentBusInformationModel? studentBusInfo;
  BusRecentTripsModel? busRecentTripInfo;
  BusNotificationsModel? busNotificationsInfo;

  Future<void> _fetchBusInformation() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');
      final studentId = prefs.getInt('student_id');
      studentName = prefs.getString('student_name') ?? '';

      final apiService = ApiService();
      final response = await apiService.postRequest(
        ApiConstants.studentBusInformation,
        {'student_id': studentId},
        token: token,
      );

      // debugPrint("STUDENT BUS RESPONSE: $response");

      if (response['status'] == true) {
        setState(() {
          studentBusInfo = StudentBusInformationModel.fromJson(response);
          isLoading = false;
        });
      } else {
        throw Exception(response['message']);
      }
    } catch (e) {
      debugPrint("FETCH ERROR: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _fetchBusRecentTrips() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');
      final studentId = prefs.getInt('student_id');
      studentName = prefs.getString('student_name') ?? '';

      final apiService = ApiService();
      final response = await apiService.postRequest(
        ApiConstants.busRecentTrips,
        {'student_id': studentId},
        token: token,
      );

      // debugPrint("STUDENT BUS RESPONSE: $response");

      if (response['status'] == true) {
        setState(() {
          busRecentTripInfo = BusRecentTripsModel.fromJson(response);
          isLoading = false;
        });
      } else {
        throw Exception(response['message']);
      }
    } catch (e) {
      debugPrint("FETCH ERROR: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _fetchBusNotifications() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');
      final studentId = prefs.getInt('student_id');
      studentName = prefs.getString('student_name') ?? '';

      final apiService = ApiService();
      final response = await apiService.postRequest(
        ApiConstants.busNotifications,
        {'student_id': studentId},
        token: token,
      );

      // debugPrint("STUDENT BUS RESPONSE: $response");

      if (response['status'] == true) {
        setState(() {
          busNotificationsInfo = BusNotificationsModel.fromJson(response);
          isLoading = false;
        });
      } else {
        throw Exception(response['message']);
      }
    } catch (e) {
      debugPrint("FETCH ERROR: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchBusInformation();
    _fetchBusRecentTrips();
    _fetchBusNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: const Color(0xFF6A11CB),
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
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Transport",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              studentName,
              style: const TextStyle(color: Colors.white, fontSize: 20),
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
                padding: const EdgeInsets.all(12),
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
            BusInformationCard(busData: studentBusInfo?.data),

            RecentTripsCard(recentTripsData: busRecentTripInfo?.data),

            // Notifications
            BusNotificationsCard(
              busNotificationsData: busNotificationsInfo?.data,
            ),
          ],
        ),
      ),
    );
  }
}
