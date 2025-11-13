import 'package:flutter/material.dart';
import 'package:school_app/components/section_title.dart';
import 'package:school_app/models/days_list_model.dart';

class DaySelectorCard extends StatelessWidget {
  final DaysListModel? daysListData;
  final String selectedDay;
  final ValueChanged<String> onDaySelected;

  const DaySelectorCard({
    super.key,
    required this.selectedDay,
    required this.onDaySelected,
    this.daysListData,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> days = [...?daysListData?.data.map((d) => d.day)];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: "Select Day"),

          const SizedBox(height: 12),

          if (days.isEmpty)
             Center(
               child: Text(
                "Days filter unavailable!",
                style: TextStyle(color: Colors.black),
                           ),
             )
          else
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: days.length,
                itemBuilder: (context, index) {
                  final day = days[index];
                  final isSelected = selectedDay == day;

                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(day),
                      selected: isSelected,
                      onSelected: (_) => onDaySelected(day),
                      selectedColor: const Color(0xFF6A11CB),
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
