import 'package:flutter/material.dart';
import 'package:school_app/components/section_title.dart';
import 'package:school_app/views/settings/changePassword/change_password_page.dart';
import 'package:school_app/views/settings/edit_profile_page.dart';

class AccountSettingsCard extends StatelessWidget {
  const AccountSettingsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          SectionTitle(title: "Account Settings"),

          SizedBox(height: 10),

          ListTile(
            leading: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.person_outline, color: Colors.blue),
            ),
            title: Text(
              "Edit Profile",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "Update your personal information",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EditProfilePage(),
                ),
              );
            },
          ),

          ListTile(
            leading: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.green[100],
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.lock_outlined, color: Colors.green),
            ),
            title: Text(
              "Change Password",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "Update your account password",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChangePasswordPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
