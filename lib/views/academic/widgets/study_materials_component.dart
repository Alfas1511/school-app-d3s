import 'package:flutter/material.dart';
import 'package:school_app/core/constants/api_constants.dart';
import 'package:school_app/models/grade_study_materials.dart';
import 'package:school_app/resources/app_spacing.dart';
import 'package:school_app/components/section_title.dart';

class StudyMaterialsComponent extends StatelessWidget {
  final bool isLoading;
  final List<GradeStudyMaterial> materials;

  const StudyMaterialsComponent({
    super.key,
    required this.isLoading,
    required this.materials,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (materials.isEmpty) {
      return const Column(
        children: [
          SectionTitle(title: "Study Materials"),

          SizedBox(height: 10),

          Center(child: Text("No study materials available.")),
        ],
      );
    }

    final gradeName = materials.first.grade?.gradeName ?? '';
    final divisionName = materials.first.division?.divisionName ?? '';
    final header =
        "Grade ${gradeName.isNotEmpty ? gradeName : ''}"
        "${divisionName.isNotEmpty ? divisionName : ''} - Study Materials";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: header),
        const SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: materials.length,
          itemBuilder: (context, index) {
            final material = materials[index];
            final subject = material.subject?.subjectsName ?? 'Unknown Subject';
            final title = material.title;
            final file = material.files.isNotEmpty
                ? material.files.first
                : null;

            return Card(
              margin: const EdgeInsets.symmetric(vertical: 6),
              elevation: 1,
              child: ListTile(
                leading: const Icon(Icons.picture_as_pdf, color: Colors.red),
                title: Text(subject),
                subtitle: Text(title),
                trailing: IconButton(
                  icon: const Icon(Icons.download, color: Colors.blue),
                  onPressed: file != null
                      ? () {
                          final filePath = file.filePath;
                          if (filePath.isEmpty) return;
                          final fileUrl =
                              "${ApiConstants.baseUrl.replaceAll('/api', '')}/$filePath";
                          debugPrint("Download file from: $fileUrl");
                          // TODO: open the URL using url_launcher or handle saving the file
                        }
                      : null,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
