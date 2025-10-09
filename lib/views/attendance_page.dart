import 'package:flutter/material.dart';
import 'package:school_app/views/academics_page.dart';
import 'package:table_calendar/table_calendar.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  // Example attendance data
  final Map<DateTime, String> attendanceStatus = {
    DateTime(2024, 3, 1): 'present',
    DateTime(2024, 3, 2): 'absent',
    DateTime(2024, 3, 4): 'present',
    DateTime(2024, 3, 5): 'present',
    DateTime(2024, 3, 10): 'late',
  };

  Color _getStatusColor(DateTime day) {
    final status = attendanceStatus[DateTime(day.year, day.month, day.day)];
    switch (status) {
      case 'present':
        return Colors.green;
      case 'absent':
        return Colors.red;
      case 'late':
        return Colors.orange;
      case 'holiday':
        return Colors.blueGrey;
      default:
        return Colors.grey[300]!;
    }
  }

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
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const AcademicPage()),
          ),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Attendance",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              "Emma Johnson - Grade 5A",
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Summary
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildSummaryItem(
                      Icons.check,
                      "18",
                      "Present",
                      Colors.green,
                    ),
                    _buildSummaryItem(Icons.close, "2", "Absent", Colors.red),
                    _buildSummaryItem(
                      Icons.schedule,
                      "1",
                      "Late",
                      Colors.orange,
                    ),
                    _buildSummaryItem(
                      Icons.calendar_month,
                      "21",
                      "Total Days",
                      Colors.blue,
                    ),
                  ],
                ),
              ),
            ),

            // Monthly View
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Monthly View",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "March 2024",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // // Calendar Grid
                    // GridView.count(
                    //   crossAxisCount: 7,
                    //   shrinkWrap: true,
                    //   physics: const NeverScrollableScrollPhysics(),
                    //   children: List.generate(31, (index) {
                    //     int day = index + 1;
                    //     Color? bgColor;
                    //     if ([1, 4, 5, 6, 7, 11, 12, 13, 14, 15].contains(day)) {
                    //       bgColor = Colors.green; // Present
                    //     } else if ([2, 8].contains(day)) {
                    //       bgColor = Colors.red; // Absent
                    //     } else if (day == 10) {
                    //       bgColor = Colors.orange; // Late
                    //     } else {
                    //       bgColor = Colors.grey[300]; // Default
                    //     }
                    //     return Center(
                    //       child: Container(
                    //         margin: const EdgeInsets.all(4),
                    //         width: 36,
                    //         height: 36,
                    //         decoration: BoxDecoration(
                    //           color: bgColor,
                    //           shape: BoxShape.circle,
                    //         ),
                    //         alignment: Alignment.center,
                    //         child: Text(
                    //           "$day",
                    //           style: const TextStyle(
                    //             color: Colors.white,
                    //             fontWeight: FontWeight.bold,
                    //           ),
                    //         ),
                    //       ),
                    //     );
                    //   }),
                    // ),

                    // TableCalendar Widget
                    TableCalendar(
                      focusedDay: _focusedDay,
                      firstDay: DateTime(2020),
                      lastDay: DateTime(2030),
                      calendarFormat: CalendarFormat.month,
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      availableGestures: AvailableGestures.all,
                      selectedDayPredicate: (day) =>
                          isSameDay(_selectedDay, day),
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                        });
                      },
                      onPageChanged: (focusedDay) {
                        setState(() => _focusedDay = focusedDay);
                      },
                      calendarStyle: CalendarStyle(
                        outsideDaysVisible: false,
                        isTodayHighlighted: true,
                        defaultTextStyle: const TextStyle(color: Colors.black),
                        todayDecoration: BoxDecoration(
                          color: Colors.blue.shade200,
                          shape: BoxShape.circle,
                        ),
                        selectedDecoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                      ),
                      calendarBuilders: CalendarBuilders(
                        defaultBuilder: (context, day, focusedDay) {
                          return _buildDayCell(day);
                        },
                        todayBuilder: (context, day, focusedDay) {
                          return _buildDayCell(day, isToday: true);
                        },
                        selectedBuilder: (context, day, focusedDay) {
                          return _buildDayCell(day, isSelected: true);
                        },
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Legend
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildLegend(Colors.green, "Present"),
                        _buildLegend(Colors.red, "Absent"),
                        _buildLegend(Colors.orange, "Late"),
                        _buildLegend(Colors.blueGrey, "Holiday"),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Recent Activity
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
                      "Recent Activity",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Container(
                    //   decoration: BoxDecoration(
                    //     color: Colors.red.withOpacity(0.1),
                    //     borderRadius: BorderRadius.circular(8),
                    //   ),
                    //   padding: const EdgeInsets.all(12),
                    //   child: Column(
                    //     children: [
                    //       Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           const Column(
                    //             crossAxisAlignment: CrossAxisAlignment.start,
                    //             children: [
                    //               Text("Absent",
                    //                   style: TextStyle(
                    //                       color: Colors.red,
                    //                       fontWeight: FontWeight.bold)),
                    //               Text("March 14, 2024",
                    //                   style: TextStyle(color: Colors.black54)),
                    //             ],
                    //           ),
                    //           Container(
                    //             padding: const EdgeInsets.symmetric(
                    //                 horizontal: 12, vertical: 6),
                    //             decoration: BoxDecoration(
                    //               color: Colors.red,
                    //               borderRadius: BorderRadius.circular(20),
                    //             ),
                    //             child: const Text("Sick Leave",
                    //                 style: TextStyle(color: Colors.white)),
                    //           ),
                    //
                    //         ],
                    //       ),
                    //       Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           const Column(
                    //             crossAxisAlignment: CrossAxisAlignment.start,
                    //             children: [
                    //               Text("Absent",
                    //                   style: TextStyle(
                    //                       color: Colors.red,
                    //                       fontWeight: FontWeight.bold)),
                    //               Text("March 14, 2024",
                    //                   style: TextStyle(color: Colors.black54)),
                    //             ],
                    //           ),
                    //           Container(
                    //             padding: const EdgeInsets.symmetric(
                    //                 horizontal: 12, vertical: 6),
                    //             decoration: BoxDecoration(
                    //               color: Colors.red,
                    //               borderRadius: BorderRadius.circular(20),
                    //             ),
                    //             child: const Text("Sick Leave",
                    //                 style: TextStyle(color: Colors.white)),
                    //           ),
                    //
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Column(
                      children: [
                        Card(
                          color: Colors.red[100],
                          child: ListTile(
                            leading: Icon(Icons.close),
                            title: Text(
                              "Absent",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text("March 14, 2024"),
                            iconColor: Colors.red,
                          ),
                        ),
                        Card(
                          color: Colors.red[100],
                          child: ListTile(
                            leading: Icon(Icons.schedule),
                            title: Text(
                              "Late Arrival",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text("March 8, 2024"),
                            iconColor: Colors.orange[900],
                          ),
                        ),
                      ],
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

  Widget _buildDayCell(
    DateTime day, {
    bool isToday = false,
    bool isSelected = false,
  }) {
    final bgColor = _getStatusColor(day);
    return Center(
      child: Container(
        margin: const EdgeInsets.all(4),
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.blue
              : isToday
              ? Colors.blue.shade200
              : bgColor,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Text(
          '${day.day}',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  // Summary widget
  Widget _buildSummaryItem(
    IconData icon,
    String value,
    String label,
    Color color,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color),
        ),
        const SizedBox(height: 6),
        Text(
          value,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }

  // Legend widget
  Widget _buildLegend(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        const SizedBox(width: 6),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
