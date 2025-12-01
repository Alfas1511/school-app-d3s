import 'package:flutter/material.dart';
import 'package:school_app/providers/auth_provider.dart';
import 'package:school_app/resources/app_icons.dart';
import 'package:school_app/resources/app_spacing.dart';
import 'package:school_app/resources/app_strings.dart';
import 'package:school_app/views/certificates/certificates_page.dart';
import 'package:school_app/views/contactSchool/contact_support_page.dart';
import 'package:school_app/views/fee_management_page.dart';
import 'package:school_app/views/gallery/gallery_page.dart';
import 'package:school_app/views/help_and_support_page.dart';
import 'package:school_app/views/leaveManagement/leave_management_page.dart';
import 'package:school_app/views/notifications_page.dart';
import 'package:school_app/views/privacyPolicy/privacy_policy_page.dart';
import 'package:school_app/views/profileManagement/profile_management_page.dart';
import 'package:school_app/views/settings/settings_page.dart';
import 'package:school_app/views/timetable/timetable_page.dart';
import 'package:school_app/views/transport/transport_page.dart';

class MoreOptionsPage extends StatelessWidget {
  const MoreOptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "More Options",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Access all app features and settings",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            AppSpacing.vertical(height: 4),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Profile Management tile
            _listingTiles(
              title: AppStrings.profileManagement,
              subtitle: AppStrings.profileManagementSubtitle,
              leadingIcon: AppIcons.profile, // ← must be IconData
              leadingIconColor: Colors.lightBlue,
              trailingIcon: AppIcons.rightArrow, // ← must be IconData
              padding: const EdgeInsets.all(12),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileManagementPage(),
                  ),
                );
              },
            ),

            // Leave Management tile
            _listingTiles(
              title: AppStrings.leaveManagement,
              subtitle: AppStrings.leaveManagementSubtitle,
              leadingIcon: AppIcons.article, // ← must be IconData
              leadingIconColor: Colors.purple,
              trailingIcon: AppIcons.rightArrow, // ← must be IconData
              padding: const EdgeInsets.all(12),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LeaveManagementPage(),
                  ),
                );
              },
            ),

            // Transport and GPS tile
            _listingTiles(
              title: AppStrings.transportAndGps,
              subtitle: AppStrings.transportAndGpsSubtitle,
              leadingIcon: AppIcons.location, // ← must be IconData
              leadingIconColor: Colors.green,
              trailingIcon: AppIcons.rightArrow, // ← must be IconData
              padding: const EdgeInsets.all(12),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TransportPage(),
                  ),
                );
              },
            ),

            // Certificates tile
            _listingTiles(
              title: AppStrings.certficates,
              subtitle: AppStrings.certficatesSubtitle,
              leadingIcon: AppIcons.workspacePremium, // ← must be IconData
              leadingIconColor: Colors.orange,
              trailingIcon: AppIcons.rightArrow, // ← must be IconData
              padding: const EdgeInsets.all(12),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CertificatesPage(),
                  ),
                );
              },
            ),

            // Fee Management tile
            _listingTiles(
              title: AppStrings.feesManagement,
              subtitle: AppStrings.feesManagementSubtitle,
              leadingIcon: AppIcons.payment, // ← must be IconData
              leadingIconColor: Colors.purple,
              trailingIcon: AppIcons.rightArrow, // ← must be IconData
              padding: const EdgeInsets.all(12),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FeeManagementPage(),
                  ),
                );
              },
            ),

            // Timetable tile
            _listingTiles(
              title: AppStrings.timetable,
              subtitle: AppStrings.timetableSubtitle,
              leadingIcon: AppIcons.calendarMonth, // ← must be IconData
              leadingIconColor: Colors.blue,
              trailingIcon: AppIcons.rightArrow, // ← must be IconData
              padding: const EdgeInsets.all(12),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TimetablePage(),
                  ),
                );
              },
            ),

            // Gallery tile
            _listingTiles(
              title: AppStrings.gallery,
              subtitle: AppStrings.gallerySubtitle,
              leadingIcon: AppIcons.camera, // ← must be IconData
              leadingIconColor: Colors.redAccent,
              trailingIcon: AppIcons.rightArrow, // ← must be IconData
              padding: const EdgeInsets.all(12),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GalleryPage()),
                );
              },
            ),

            // Notifications tile
            _listingTiles(
              title: AppStrings.notifications,
              subtitle: AppStrings.settingsSubtitle,
              leadingIcon: AppIcons.notifications, // ← must be IconData
              leadingIconColor: Colors.redAccent,
              trailingIcon: AppIcons.rightArrow, // ← must be IconData
              padding: const EdgeInsets.all(12),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificationsPage(),
                  ),
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

            // Sign Out tile
            _listingTiles(
              title: AppStrings.signOut,
              subtitle: AppStrings.signOutSubtitle,
              leadingIcon: AppIcons.signOut, // ← must be IconData
              leadingIconColor: Colors.red,
              padding: const EdgeInsets.all(12),
              onTap: () {
                AuthProvider().logoutUser(context);
              },
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
    IconData? trailingIcon,
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
          trailing: trailingIcon != null ? Icon(trailingIcon) : null,
          onTap: onTap,
        ),
      ),
    );
  }
}
