import 'package:flutter/material.dart';
import 'package:school_app/models/student_attendance_model.dart';
import 'package:table_calendar/table_calendar.dart';

class MonthlyViewCard extends StatefulWidget {
  final StudentAttendanceModel? studentResponse;

  const MonthlyViewCard({super.key, required this.studentResponse});

  @override
  State<MonthlyViewCard> createState() => _MonthlyViewCardState();
}

class _MonthlyViewCardState extends State<MonthlyViewCard> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  // Read attendance status for a given day
  String? _getStatus(DateTime day) {
    final attendanceList =
        widget.studentResponse?.data?.attendanceDetails ?? [];
    final holidayList = widget.studentResponse?.data?.holidays ?? [];

    for (var item in attendanceList) {
      final itemDate = DateTime.parse(item.attendanceDate);

      if (itemDate.year == day.year &&
          itemDate.month == day.month &&
          itemDate.day == day.day) {
        return item.attendanceStatus.toLowerCase();
      }
    }

    for (var h in holidayList) {
      final hDate = DateTime.parse(h.holidayDate);
      if (hDate.year == day.year &&
          hDate.month == day.month &&
          hDate.day == day.day) {
        return "holiday";
      }
    }

    return null; // No record for this day
  }

  // Get color based on status
  Color _getStatusColor(DateTime day) {
    final status = _getStatus(day);

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
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Monthly View",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${_focusedDay.monthName} ${_focusedDay.year}",
                  style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Table Calendar
            TableCalendar(
              focusedDay: _focusedDay,
              firstDay: DateTime(2020),
              lastDay: DateTime(2030),
              startingDayOfWeek: StartingDayOfWeek.monday,
              calendarFormat: CalendarFormat.month,
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
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
    );
  }

  // Build Each Day Box
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
          style: TextStyle(
            color: (isSelected || isToday) ? Colors.white : Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // Legend Builder
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

// Extension for month names
extension MonthName on DateTime {
  String get monthName {
    const months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December",
    ];
    return months[month - 1];
  }
}
