import 'package:flutter/material.dart';
import 'package:school_app/components/section_title.dart';

class NotificationsPreferencesCard extends StatefulWidget {
  const NotificationsPreferencesCard({super.key});

  @override
  State<NotificationsPreferencesCard> createState() =>
      _NotificationsPreferencesCardState();
}

class _NotificationsPreferencesCardState
    extends State<NotificationsPreferencesCard> {
  @override
  Widget build(BuildContext context) {
    bool _academicUpdatesToggle = true; // initial state
    bool _attendanceUpdateToggle = true; // initial state
    bool _transportUpdateToggle = false; // initial state
    bool _feeRemindersToggle = true; // initial state
    bool _generalAnnouncementsToggle = true; // initial state

    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
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
          SectionTitle(title: "Notification Preferences"),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.book_outlined,
                      color: Colors.blue,
                      size: 25,
                    ),
                  ),
                  title: Text(
                    "Academic Updates",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "Homework, assignments, and exam notifications",
                  ),
                  trailing: Switch(
                    value: _academicUpdatesToggle,
                    activeColor: _academicUpdatesToggle
                        ? Colors.green
                        : Colors.red,
                    onChanged: (value) {
                      setState(() {
                        _academicUpdatesToggle = value;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            _academicUpdatesToggle
                                ? "Academic Updated Changed!"
                                : "Academic Updated Changed!",
                          ),
                          duration: Duration(seconds: 2),
                          backgroundColor: _academicUpdatesToggle
                              ? Colors.green
                              : Colors.red,
                        ),
                      );
                    },
                  ),
                ),

                ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.calendar_month_outlined,
                      color: Colors.blue,
                      size: 25,
                    ),
                  ),

                  title: Text(
                    "Attendance Alerts",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("Daily attendance and absence notifications"),
                  trailing: Switch(
                    value: _attendanceUpdateToggle,
                    activeColor: _attendanceUpdateToggle
                        ? Colors.green
                        : Colors.red,
                    onChanged: (value) {
                      setState(() {
                        _attendanceUpdateToggle = value;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            _attendanceUpdateToggle
                                ? "Attendance Alert Changed!"
                                : "Attendance Alert Changed!",
                          ),
                          duration: Duration(seconds: 2),
                          backgroundColor: _attendanceUpdateToggle
                              ? Colors.green
                              : Colors.red,
                        ),
                      );
                    },
                  ),
                ),

                ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.bus_alert_outlined,
                      color: Colors.blue,
                      size: 25,
                    ),
                  ),
                  title: Text(
                    "Transport Updates",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("Bus tracking and route change notifications"),
                  trailing: Switch(
                    value: _transportUpdateToggle,
                    activeColor: _transportUpdateToggle
                        ? Colors.green
                        : Colors.red,
                    onChanged: (value) {
                      setState(() {
                        _transportUpdateToggle = value;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            _transportUpdateToggle
                                ? "Transport Updates Changed!"
                                : "Transport Updates Changed!",
                          ),
                          duration: Duration(seconds: 2),
                          backgroundColor: _transportUpdateToggle
                              ? Colors.green
                              : Colors.red,
                        ),
                      );
                    },
                  ),
                ),

                ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.money_outlined,
                      color: Colors.blue,
                      size: 25,
                    ),
                  ),
                  title: Text(
                    "Fee Reminders",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("Payment due dates and fee structure updates"),
                  trailing: Switch(
                    value: _feeRemindersToggle,
                    activeColor: _feeRemindersToggle
                        ? Colors.green
                        : Colors.red,
                    onChanged: (value) {
                      setState(() {
                        _feeRemindersToggle = value;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
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
                  leading: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.announcement_outlined,
                      color: Colors.blue,
                      size: 25,
                    ),
                  ),
                  title: Text(
                    "General Announcements",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
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
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                _generalAnnouncementsToggle
                                    ? "General Announcements Changed!"
                                    : "General Announcements Changed!",
                              ),
                              duration: Duration(seconds: 2),
                              backgroundColor: _generalAnnouncementsToggle
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
        ],
      ),
    );
  }
}
