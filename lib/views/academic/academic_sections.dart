import 'package:flutter/material.dart';
import 'package:school_app/models/exam_timetable_model.dart';
import 'package:school_app/models/student_exam_ranks_model.dart';
import 'package:school_app/models/student_exam_results_model.dart';
import 'package:school_app/resources/app_colours.dart';
import 'package:school_app/resources/app_icons.dart';
import 'package:school_app/resources/app_spacing.dart';
import 'package:school_app/views/academic/widgets/academic_sections_list.dart';
import 'package:school_app/views/academic/widgets/exams_component.dart';
import 'package:school_app/views/academic/widgets/results_component.dart';
import 'package:school_app/components/section_title.dart';
import 'package:school_app/views/academic/widgets/student_progress_component.dart';
import 'package:school_app/views/academic/widgets/study_materials_component.dart';
import 'package:school_app/views/academic/widgets/syllabus_component.dart';
import 'package:school_app/core/constants/api_constants.dart';
import 'package:school_app/core/services/api_service.dart';
import 'package:school_app/models/grade_study_materials.dart';
import 'package:school_app/views/anecdotalRecords/anecdotal_records_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AcademicSections extends StatefulWidget {
  const AcademicSections({super.key});

  @override
  State<AcademicSections> createState() => _AcademicSectionsState();
}

class _AcademicSectionsState extends State<AcademicSections> {
  int selectedSubject = 0;
  int selectedTab = 0;

  final List<String> subjects = ["Mathematics", "English", "Science"];
  final List<String> tabs = ["Study Materials", "Syllabus"];

  final List<AcademicSectionsList> sections = [
    AcademicSectionsList("Materials", AppIcons.file, "#6610F2"),
    AcademicSectionsList("Syllabus", AppIcons.book, "#28A745"),
    AcademicSectionsList("Exams", AppIcons.exam, "#9C27B0"),
    AcademicSectionsList("Results", AppIcons.results, "#FF5722"),
    AcademicSectionsList("Progress", AppIcons.progress, "#3F51B5"),
    AcademicSectionsList("Records", AppIcons.records, "#198754"),
  ];

  int selectedSectionIndex = 0;
  bool isLoading = true;
  List<GradeStudyMaterial> materials = [];
  ExamTimeTableModel? examsTimeTable;
  StudentExamResultsModel? examsResults;
  StudentExamRanksModel? examRanks;

  Future<void> _fetchStudyMaterials() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');
      final gradeId = prefs.getString('student_grade_id');
      final divisionId = prefs.getString('student_division_id');

      if (gradeId == null || divisionId == null) {
        throw Exception("Grade or Division ID missing in SharedPreferences");
      }

      final apiService = ApiService();
      final response = await apiService.getRequest(
        "${ApiConstants.gradeStudyMaterials}?grade_id=$gradeId&division_id=$divisionId",
        token: token,
      );

      if (response['status'] == true) {
        final data = GradeStudyMaterials.fromJson(response);
        setState(() {
          materials = data.data;
          isLoading = false;
        });
      } else {
        throw Exception(response['message'] ?? 'Unknown error');
      }
    } catch (e) {
      debugPrint('Error fetching study materials: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _fetchExamTimetable() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');
      final gradeId = prefs.getString('student_grade_id');

      if (gradeId == null) throw Exception("Grade ID missing");

      final apiService = ApiService();
      final body = {'grade_id': gradeId};

      final response = await apiService.postRequest(
        ApiConstants.examTimetableList,
        body,
        token: token,
      );

      if (response['status'] == true) {
        final examTable = ExamTimeTableModel.fromJson(response);
        setState(() {
          examsTimeTable = examTable;
          isLoading = false;
        });
      } else {
        throw Exception(response['message'] ?? 'Unknown error');
      }
    } catch (e) {
      debugPrint("Error fetching exam timetable: $e");
      setState(() => isLoading = false);
    }
  }

  Future<void> _fetchStudentExamResults() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');
      final studentId = prefs.getInt('selected_student_id');
      final gradeId = prefs.getString('student_grade_id');
      final divisionId = prefs.getString('student_division_id');

      final apiService = ApiService();
      final body = {
        'student_id': studentId,
        'grade_id': gradeId,
        'division_id': divisionId,
      };

      final response = await apiService.postRequest(
        ApiConstants.studentExamRanksList,
        body,
        token: token,
      );

      if (response['status'] == true) {
        final studentExamRanks = StudentExamRanksModel.fromJson(response);
        setState(() {
          examRanks = studentExamRanks;
          isLoading = false;
        });
      } else {
        throw Exception(response['message'] ?? 'Unknown error');
      }
    } catch (e) {
      debugPrint("Error fetching exam ranks: $e");
      setState(() => isLoading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchStudyMaterials();
    _fetchExamTimetable();
    _fetchStudentExamResults();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
          child: Container(
            padding: const EdgeInsets.all(12),
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
                AppSpacing.vertical(height: 4),

                SectionTitle(title: "Academic Sections"),

                const SizedBox(height: 20),
                _buildAcademicSections(),
              ],
            ),
          ),
        ),

        AppSpacing.vertical(height: 12),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [AppSpacing.vertical(height: 4), _buildContentCard()],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAcademicSections() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: sections.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemBuilder: (context, index) {
        final section = sections[index];
        final isSelected = selectedSectionIndex == index;

        return GestureDetector(
          onTap: () {
            if (section.title == "Records") {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AnecdotalRecordsPage(),
                ),
              );
            } else {
              setState(() {
                selectedSectionIndex = index;
              });
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColours.hexToColor(section.color ?? "").withOpacity(0.6)
                  : AppColours.hexToColor(section.color ?? "").withOpacity(0.9),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected ? Colors.blue : Colors.transparent,
                width: 2,
              ),
            ),
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColours.hexToColor(section.color ?? ""),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    section.icon,
                    size: 28,
                    color: isSelected ? Colors.white : Colors.white,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  section.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.white : Colors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildContentCard() {
    switch (selectedSectionIndex) {
      case 0:
        return StudyMaterialsComponent(
          isLoading: isLoading,
          materials: materials,
        );
      case 1:
        return SyllabusComponent();
      case 2:
        return ExamsComponent(
          isLoading: isLoading,
          examsTimeTable: examsTimeTable,
        );
      case 3:
        return ResultsComponent(
          isLoading: isLoading,
          examsResults: examsResults,
        );
      case 4:
        return StudentProgressComponent(examRanksData: examRanks);
      default:
        return const SizedBox.shrink();
    }
  }
}
