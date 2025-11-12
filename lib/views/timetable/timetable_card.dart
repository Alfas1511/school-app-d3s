import 'package:flutter/material.dart';
import 'package:school_app/models/grade_division_timetable_model.dart';
import 'package:school_app/components/section_title.dart';

class TimetableCard extends StatelessWidget {
  final String? selectedDay;
  final GradeDivisionTimetableModel? timetableData;
  const TimetableCard({super.key, this.selectedDay, this.timetableData});

  @override
  Widget build(BuildContext context) {
    final timetableDetails = timetableData?.data ?? [];

    if (timetableDetails.isEmpty) {
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
            SectionTitle(title: "Timetable Schedule"),

            SizedBox(height: 10),

            Center(child: Text("Timetable unavailable!")),
          ],
        ),
      );
    } else {
      return Container(
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [SectionTitle(title: "$selectedDay Schedule")],
              ),

              ...timetableDetails.map(
                (timetableDetail) => Padding(
                  padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          "${timetableDetail.startTime} - ${timetableDetail.endTime}",
                        ),
                      ),

                      Expanded(
                        flex: 1,
                        child: const Icon(
                          Icons.file_copy,
                          color: Colors.purple,
                        ),
                      ),

                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              timetableDetail.classSubjectName,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(timetableDetail.subjectTeacher),
                          ],
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
}
