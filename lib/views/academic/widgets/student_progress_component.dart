import 'package:flutter/material.dart';
import 'package:school_app/components/section_title.dart';
import 'package:school_app/models/student_exam_ranks_model.dart';

class StudentProgressComponent extends StatelessWidget {
  final StudentExamRanksModel? examRanksData;
  const StudentProgressComponent({super.key, this.examRanksData});

  @override
  Widget build(BuildContext context) {
    final examRanks = examRanksData?.data ?? [];
    return Column(
      children: [
        SectionTitle(title: "Progress Card"),
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.blue[200],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Overall Rank #4',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text('Out of 45 students in Grade 5A'),
                    Text(
                      'Average: 90% - Grade A+',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),

              if (examRanks.isEmpty)
                const Center(child: Text("Exam Ranks unavailable!"))
              else
                ...examRanks.map((examRank) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            examRank.subjectName ?? "",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 2,
                              horizontal: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green[400],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text('Rank #${examRank.rank}'),
                          ),
                        ],
                      ),

                      SizedBox(height: 6),
                    ],
                  );
                }),
            ],
          ),
        ),
      ],
    );
  }
}
