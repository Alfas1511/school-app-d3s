import 'package:flutter/material.dart';
import 'package:school_app/resources/app_icons.dart';
import 'package:school_app/resources/app_strings.dart';
import 'package:school_app/views/certificates_page.dart';
import 'package:school_app/views/contact_support_page.dart';
import 'package:school_app/views/fee_management_page.dart';
import 'package:school_app/views/gallery_page.dart';
import 'package:school_app/views/help_and_support_page.dart';
import 'package:school_app/views/leave_management_page.dart';
import 'package:school_app/views/notifications_page.dart';
import 'package:school_app/views/privacy_policy_page.dart';
import 'package:school_app/views/profile_management_page.dart';
import 'package:school_app/views/settings_page.dart';
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
                ),
                padding: const EdgeInsets.all(8),
                child: ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(8), // space around the icon
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(
                        0.1,
                      ), // light background shade
                      shape: BoxShape.circle, // makes it round
                    ),
                    child: const Icon(Icons.person, color: Colors.lightBlue),
                  ),
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
                ),
                padding: const EdgeInsets.all(8),
                child: ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(8), // space around the icon
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(
                        0.1,
                      ), // light background shade
                      shape: BoxShape.circle, // makes it round
                    ),
                    child: const Icon(Icons.article, color: Colors.purple),
                  ),
                  title: Text(
                    "Leave Management",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "Submit and track leave applications",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
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
                ),
                padding: const EdgeInsets.all(8),
                child: ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(8), // space around the icon
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(
                        0.1,
                      ), // light background shade
                      shape: BoxShape.circle, // makes it round
                    ),
                    child: const Icon(Icons.location_on, color: Colors.green),
                  ),
                  title: Text(
                    "Transport & GPS",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
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
                ),
                padding: const EdgeInsets.all(8),
                child: ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(8), // space around the icon
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(
                        0.1,
                      ), // light background shade
                      shape: BoxShape.circle, // makes it round
                    ),
                    child: const Icon(
                      Icons.workspace_premium,
                      color: Colors.orange,
                    ),
                  ),
                  title: Text(
                    "Certificates",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
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
                ),
                padding: const EdgeInsets.all(8),
                child: ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(8), // space around the icon
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(
                        0.1,
                      ), // light background shade
                      shape: BoxShape.circle, // makes it round
                    ),
                    child: const Icon(Icons.money, color: Colors.purple),
                  ),
                  title: Text(
                    "Fees Management",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
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
                ),
                padding: const EdgeInsets.all(8),
                child: ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(8), // space around the icon
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(
                        0.1,
                      ), // light background shade
                      shape: BoxShape.circle, // makes it round
                    ),
                    child: const Icon(Icons.calendar_month, color: Colors.blue),
                  ),
                  title: Text(
                    "Timetable",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
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
                ),
                padding: const EdgeInsets.all(8),
                child: ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(8), // space around the icon
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(
                        0.1,
                      ), // light background shade
                      shape: BoxShape.circle, // makes it round
                    ),
                    child: const Icon(Icons.camera, color: Colors.red),
                  ),
                  title: Text(
                    "Gallery",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
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
                ),
                padding: const EdgeInsets.all(8),
                child: ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(8), // space around the icon
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(
                        0.1,
                      ), // light background shade
                      shape: BoxShape.circle, // makes it round
                    ),
                    child: const Icon(
                      Icons.notifications,
                      color: Colors.redAccent,
                    ),
                  ),
                  title: Text(
                    "Notifications",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
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

            // Notifications tile
            _listingTiles(
              title: AppStrings.notifications,
              subtitle: AppStrings.settingsSubtitle,
              leadingIcon: AppIcons.settings, // ← must be IconData
              leadingIconColor: Colors.brown,
              trailingIcon: AppIcons.rightArrow, // ← must be IconData
              padding: const EdgeInsets.all(12),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
              },
            ),

            // Settings tile
            _listingTiles(
              title: AppStrings.settings,
              subtitle: AppStrings.settingsSubtitle,
              leadingIcon: AppIcons.settings, // ← must be IconData
              leadingIconColor: Colors.brown,
              trailingIcon: AppIcons.rightArrow, // ← must be IconData
              padding: const EdgeInsets.all(12),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
              },
            ),

            // Contact School tile
            _listingTiles(
              title: AppStrings.contatSchool,
              subtitle: AppStrings.contatSchoolSubtitle,
              leadingIcon: AppIcons.call, // ← must be IconData
              leadingIconColor: Colors.green,
              trailingIcon: AppIcons.rightArrow, // ← must be IconData
              padding: const EdgeInsets.all(12),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ContactSupportPage(),
                  ),
                );
              },
            ),

            // Privacy Policy tile
            _listingTiles(
              title: AppStrings.privacyPolicy,
              subtitle: AppStrings.privacyPolicySubtitle,
              leadingIcon: AppIcons.privacy, // ← must be IconData
              leadingIconColor: Colors.orange,
              trailingIcon: AppIcons.rightArrow, // ← must be IconData
              padding: const EdgeInsets.all(12),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PrivacyPolicyPage(),
                  ),
                );
              },
            ),

            // Help and Support tile
            _listingTiles(
              title: AppStrings.helpAndSupport,
              subtitle: AppStrings.helpAndSupportSubTitle,
              leadingIcon: AppIcons.help, // ← must be IconData
              leadingIconColor: Colors.blue,
              trailingIcon: AppIcons.rightArrow, // ← must be IconData
              padding: const EdgeInsets.all(12),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HelpAndSupportPage(),
                  ),
                );
              },
            ),

            Padding(
              padding: EdgeInsets.all(12),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(8),
                child: ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(8), // space around the icon
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(
                        0.1,
                      ), // light background shade
                      shape: BoxShape.circle, // makes it round
                    ),
                    child: const Icon(
                      Icons.exit_to_app_rounded,
                      color: Colors.red,
                    ),
                  ),
                  title: Text(
                    "Sign Out",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("Sign out of the app"),
                  trailing: Icon(Icons.arrow_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HelpAndSupportPage(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _listingTiles({
    required String title,
    required String subtitle,
    required Color leadingIconColor,
    required IconData leadingIcon,
    required IconData trailingIcon,
    required EdgeInsets padding,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: padding,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(8),
        child: ListTile(
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(leadingIcon, color: leadingIconColor),
          ),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(subtitle),
          trailing: Icon(trailingIcon),
          onTap: onTap,
        ),
      ),
    );
  }
}
