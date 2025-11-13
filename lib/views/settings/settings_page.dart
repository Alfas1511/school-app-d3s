import "package:flutter/material.dart";
import "package:school_app/components/section_title.dart";
import "package:school_app/views/privacyPolicy/data_security_card.dart";
import "package:school_app/views/settings/about_app_card.dart";
import "package:school_app/views/settings/account_settings_card.dart";
import "package:school_app/views/settings/app_preferences_card.dart";
import "package:school_app/views/settings/changePassword/change_password_page.dart";
import "package:school_app/views/settings/data_storage_card.dart";
import "package:school_app/views/settings/edit_profile_page.dart";
import "package:school_app/views/settings/notifications_preferences_card.dart";

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String selectedLanguage = "English";
  final List<String> languages = ["English", "Hindi", "Malayalam"];

  String selectedTheme = "Light";
  final List<String> themeModes = ["Light", "Dark", "System default"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // backgroundColor: const Color(0xFFF8B2CDF),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFF252F3E), Color(0xFFF252F3E)],
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
            Text("Back to More", style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Color(0xFFF252F3E),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Settings",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          "Manage your app preferences",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  AccountSettingsCard(),
                  SizedBox(height: 10),
                  AppPreferencesCard(),
                  SizedBox(height: 10),
                  NotificationsPreferencesCard(),
                  SizedBox(height: 10),
                  DataStorageCard(),
                  SizedBox(height: 10),
                  AboutAppCard(),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
