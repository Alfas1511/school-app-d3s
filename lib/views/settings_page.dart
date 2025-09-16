import "package:flutter/material.dart";

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

  bool _academicUpdatesToggle = true; // initial state
  bool _attendanceUpdateToggle = true; // initial state
  bool _transportUpdateToggle = false; // initial state
  bool _feeRemindersToggle = true; // initial state
  bool _generalAnnouncementsToggle = true; // initial state

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
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                width: double.infinity,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Account Settings",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListTile(
                        leading: Icon(Icons.person, color: Colors.blue),
                        title: Text(
                          "Edit Profile",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "Update your personal information",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        trailing: Icon(Icons.arrow_right),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(color: Colors.grey[200]),
                      child: ListTile(
                        leading: Icon(Icons.lock, color: Colors.blue),
                        title: Text(
                          "Change Password",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "Update your account password",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        trailing: Icon(Icons.arrow_right),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // App Preferences Section
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                width: double.infinity,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "App Preferences",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Language",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                10,
                                10,
                                10,
                                10,
                              ),
                              child: DropdownButton<String>(
                                value: selectedLanguage,
                                isExpanded: true,
                                underline: const SizedBox(),
                                items: languages
                                    .map(
                                      (child) => DropdownMenuItem(
                                        value: child,
                                        child: Text(child),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedLanguage = value!;
                                  });
                                },
                              ),
                            ),

                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Theme",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                10,
                                10,
                                10,
                                10,
                              ),
                              child: DropdownButton<String>(
                                value: selectedTheme,
                                isExpanded: true,
                                underline: const SizedBox(),
                                items: themeModes
                                    .map(
                                      (child) => DropdownMenuItem(
                                        value: child,
                                        child: Text(child),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedTheme = value!;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Notification Preferences Section
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                width: double.infinity,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Notification Preferences",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            ListTile(
                              leading: Icon(
                                Icons.book,
                                color: Colors.blue,
                                size: 25,
                              ),
                              title: Text("Academic Updates"),
                              subtitle: Text(
                                "Homework, assignments, and exam notifications",
                              ),
                              trailing:
                                  // Icon(
                                  //   Icons.toggle_on,
                                  //   color: Colors.green,
                                  //   size: 40,
                                  // ),
                                  Switch(
                                    value: _academicUpdatesToggle,
                                    activeColor: _academicUpdatesToggle
                                        ? Colors.green
                                        : Colors.red,
                                    onChanged: (value) {
                                      setState(() {
                                        _academicUpdatesToggle = value;
                                      });
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            _academicUpdatesToggle
                                                ? "Academic Updated Changed!"
                                                : "Academic Updated Changed!",
                                          ),
                                          duration: Duration(seconds: 2),
                                          backgroundColor:
                                              _academicUpdatesToggle
                                              ? Colors.green
                                              : Colors.red,
                                        ),
                                      );
                                    },
                                  ),
                            ),

                            ListTile(
                              leading: Icon(
                                Icons.calendar_month,
                                color: Colors.blue,
                                size: 25,
                              ),
                              title: Text("Attendance Alerts"),
                              subtitle: Text(
                                "Daily attendance and absence notifications",
                              ),
                              trailing:
                                  // Icon(
                                  //   Icons.toggle_on,
                                  //   color: Colors.green,
                                  //   size: 40,
                                  // ),
                                  Switch(
                                    value: _attendanceUpdateToggle,
                                    activeColor: _attendanceUpdateToggle
                                        ? Colors.green
                                        : Colors.red,
                                    onChanged: (value) {
                                      setState(() {
                                        _attendanceUpdateToggle = value;
                                      });
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            _attendanceUpdateToggle
                                                ? "Attendance Alert Changed!"
                                                : "Attendance Alert Changed!",
                                          ),
                                          duration: Duration(seconds: 2),
                                          backgroundColor:
                                              _attendanceUpdateToggle
                                              ? Colors.green
                                              : Colors.red,
                                        ),
                                      );
                                    },
                                  ),
                            ),

                            ListTile(
                              leading: Icon(
                                Icons.bus_alert,
                                color: Colors.blue,
                                size: 25,
                              ),
                              title: Text("Transport Updates"),
                              subtitle: Text(
                                "Bus tracking and route change notifications",
                              ),
                              trailing:
                                  // Icon(
                                  //   Icons.toggle_off,
                                  //   color: Colors.red,
                                  //   size: 40,
                                  // ),
                                  Switch(
                                    value: _transportUpdateToggle,
                                    activeColor: _transportUpdateToggle
                                        ? Colors.green
                                        : Colors.red,
                                    onChanged: (value) {
                                      setState(() {
                                        _transportUpdateToggle = value;
                                      });
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            _transportUpdateToggle
                                                ? "Transport Updates Changed!"
                                                : "Transport Updates Changed!",
                                          ),
                                          duration: Duration(seconds: 2),
                                          backgroundColor:
                                              _transportUpdateToggle
                                              ? Colors.green
                                              : Colors.red,
                                        ),
                                      );
                                    },
                                  ),
                            ),

                            ListTile(
                              leading: Icon(
                                Icons.money,
                                color: Colors.blue,
                                size: 25,
                              ),
                              title: Text("Fee Reminders"),
                              subtitle: Text(
                                "Payment due dates and fee structure updates",
                              ),
                              trailing:
                                  // Icon(
                                  //   Icons.toggle_on,
                                  //   color: Colors.green,
                                  //   size: 40,
                                  // ),
                                  Switch(
                                    value: _feeRemindersToggle,
                                    activeColor: _feeRemindersToggle
                                        ? Colors.green
                                        : Colors.red,
                                    onChanged: (value) {
                                      setState(() {
                                        _feeRemindersToggle = value;
                                      });
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            _feeRemindersToggle
                                                ? "Fee Reminders Changed!"
                                                : "Fee Reminders Changed!",
                                          ),
                                          duration: Duration(seconds: 2),
                                          backgroundColor: _feeRemindersToggle
                                              ? Colors.green
                                              : Colors.red,
                                        ),
                                      );
                                    },
                                  ),
                            ),

                            ListTile(
                              leading: Icon(
                                Icons.announcement,
                                color: Colors.blue,
                                size: 25,
                              ),
                              title: Text("General Announcements"),
                              subtitle: Text(
                                "School events, holidays and important notices",
                              ),
                              trailing:
                                  // Icon(
                                  //   Icons.toggle_on,
                                  //   color: Colors.green,
                                  //   size: 40,
                                  // ),
                                  Switch(
                                    value: _generalAnnouncementsToggle,
                                    activeColor: _generalAnnouncementsToggle
                                        ? Colors.green
                                        : Colors.red,
                                    onChanged: (value) {
                                      setState(() {
                                        _generalAnnouncementsToggle = value;
                                      });
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            _generalAnnouncementsToggle
                                                ? "General Announcements Changed!"
                                                : "General Announcements Changed!",
                                          ),
                                          duration: Duration(seconds: 2),
                                          backgroundColor:
                                              _generalAnnouncementsToggle
                                              ? Colors.green
                                              : Colors.red,
                                        ),
                                      );
                                    },
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Data & Storage Section
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                width: double.infinity,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Data & Storage",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            ListTile(
                              leading: Icon(
                                Icons.download,
                                color: Colors.orange,
                                size: 25,
                              ),
                              title: Text("Download Data"),
                              subtitle: Text("Export your data and records"),
                              trailing: Icon(Icons.arrow_right),
                            ),

                            ListTile(
                              leading: Icon(
                                Icons.delete,
                                color: Colors.red,
                                size: 25,
                              ),
                              title: Text("Clear Cache"),
                              subtitle: Text("Free up storage space"),
                              trailing: Icon(Icons.arrow_right),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // About App Section
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                width: double.infinity,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "About App",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [Text("Version"), Text("2.1.0")],
                            ),

                            SizedBox(height: 10),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Last Updates"),
                                Text("Jan 15 2024"),
                              ],
                            ),

                            SizedBox(height: 10),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [Text("Build Number"), Text("210.1")],
                            ),
                          ],
                        ),
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
