import 'package:flutter/material.dart';
import 'package:school_app/views/certificates_page.dart';
import 'package:school_app/views/fee_management_page.dart';
import 'package:school_app/views/gallery_page.dart';
import 'package:school_app/views/leave_management_page.dart';
import 'package:school_app/views/notifications_page.dart';
import 'package:school_app/views/profile_management_page.dart';
import 'package:school_app/views/timetable_page.dart';
import 'package:school_app/views/transport_page.dart';

class MoreOptionsPage extends StatelessWidget {
  const MoreOptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "More Options",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "Access all app features and settings",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            Padding(
              padding: EdgeInsets.all(12),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0, 0),
                      blurRadius: 2,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(8),
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text(
                    "Profile Management",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "View and edit family and student information",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  trailing: Icon(Icons.arrow_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const ProfileManagementPage(), // your target page
                      ),
                    );
                  },
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(12),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0, 0),
                      blurRadius: 2,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(8),
                child: ListTile(
                  leading: Icon(Icons.article),
                  title: Text("Leave Management",
                      style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text("Submit and track leave applications",
                    style: TextStyle(fontWeight: FontWeight.w500),),
                  trailing: Icon(Icons.arrow_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                        const LeaveManagementPage(), // your target page
                      ),
                    );
                  },
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(12),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0, 0),
                      blurRadius: 2,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(8),
                child: ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text("Transport & GPS"),
                  subtitle: Text("Live bus tracking and transport info"),
                  trailing: Icon(Icons.arrow_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                        const TransportPage(), // your target page
                      ),
                    );
                  },
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(12),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0, 0),
                      blurRadius: 2,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(8),
                child: ListTile(
                  leading: Icon(Icons.workspace_premium),
                  title: Text("Certificates"),
                  subtitle: Text(
                    "Download achievement, character and transfer certificates",
                  ),
                  trailing: Icon(Icons.arrow_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                        const CertificatesPage(), // your target page
                      ),
                    );
                  },
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(12),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0, 0),
                      blurRadius: 2,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(8),
                child: ListTile(
                  leading: Icon(Icons.money),
                  title: Text("Fees Management"),
                  subtitle: Text("View and pay school/transport fees"),
                  trailing: Icon(Icons.arrow_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                        const FeeManagementPage(), // your target page
                      ),
                    );
                  },
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(12),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0, 0),
                      blurRadius: 2,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(8),
                child: ListTile(
                  leading: Icon(Icons.calendar_month),
                  title: Text("Timetable"),
                  subtitle: Text("Weekly class schedule"),
                  trailing: Icon(Icons.arrow_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                        const TimetablePage(), // your target page
                      ),
                    );
                  },
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(12),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0, 0),
                      blurRadius: 2,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(8),
                child: ListTile(
                  leading: Icon(Icons.photo),
                  title: Text("Gallery"),
                  subtitle: Text("School events and activities photos"),
                  trailing: Icon(Icons.arrow_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                        const GalleryPage(), // your target page
                      ),
                    );
                  },
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(12),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0, 0),
                      blurRadius: 2,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(8),
                child: ListTile(
                  leading: Icon(Icons.notifications),
                  title: Text("Notifications"),
                  subtitle: Text("All announcements and updates"),
                  trailing: Icon(Icons.arrow_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                        const NotificationsPage(), // your target page
                      ),
                    );
                  },
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(12),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0, 2),
                      blurRadius: 5,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(8),
                child: ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Settings"),
                  subtitle: Text("App preferences and account settings"),
                  trailing: Icon(Icons.arrow_right),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(12),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0, 2),
                      blurRadius: 5,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(8),
                child: ListTile(
                  leading: Icon(Icons.call),
                  title: Text("Contact School"),
                  subtitle: Text("Get in touch with school administration"),
                  trailing: Icon(Icons.arrow_right),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(12),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0, 2),
                      blurRadius: 5,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(8),
                child: ListTile(
                  leading: Icon(Icons.privacy_tip),
                  title: Text("Privacy Policy"),
                  subtitle: Text("Terms and privacy information"),
                  trailing: Icon(Icons.arrow_right),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(12),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0, 2),
                      blurRadius: 5,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(8),
                child: ListTile(
                  leading: Icon(Icons.help),
                  title: Text("Help & Support"),
                  subtitle: Text("FAQ and Support contact"),
                  trailing: Icon(Icons.arrow_right),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
