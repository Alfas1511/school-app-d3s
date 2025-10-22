class GradeStudyMaterials {
  final bool status;
  final String message;
  final List<GradeStudyMaterial> data;

  GradeStudyMaterials({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GradeStudyMaterials.fromJson(Map<String, dynamic> json) {
    return GradeStudyMaterials(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null
          ? List<GradeStudyMaterial>.from(
              json['data'].map((x) => GradeStudyMaterial.fromJson(x)),
            )
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "status": status,
      "message": message,
      "data": data.map((x) => x.toJson()).toList(),
    };
  }
}

class GradeStudyMaterial {
  final int id;
  final String title;
  final String? description;
  final int gradeId;
  final int divisionId;
  final int? streamId;
  final int subjectId;
  final String? module;
  final String visibility;
  final int uploadedBy;
  final int isNotified;
  final String createdAt;
  final String updatedAt;
  final Grade? grade;
  final Division? division;
  final Subject? subject;
  final List<MaterialFile> files;
  final dynamic stream;

  GradeStudyMaterial({
    required this.id,
    required this.title,
    this.description,
    required this.gradeId,
    required this.divisionId,
    this.streamId,
    required this.subjectId,
    this.module,
    required this.visibility,
    required this.uploadedBy,
    required this.isNotified,
    required this.createdAt,
    required this.updatedAt,
    this.grade,
    this.division,
    this.subject,
    required this.files,
    this.stream,
  });

  factory GradeStudyMaterial.fromJson(Map<String, dynamic> json) {
    return GradeStudyMaterial(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'],
      gradeId: json['grade_id'] ?? 0,
      divisionId: json['division_id'] ?? 0,
      streamId: json['stream_id'],
      subjectId: json['subject_id'] ?? 0,
      module: json['module'],
      visibility: json['visibility'] ?? '',
      uploadedBy: json['uploaded_by'] ?? 0,
      isNotified: json['is_notified'] ?? 0,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      grade: json['grade'] != null ? Grade.fromJson(json['grade']) : null,
      division: json['division'] != null
          ? Division.fromJson(json['division'])
          : null,
      subject: json['subject'] != null
          ? Subject.fromJson(json['subject'])
          : null,
      files: json['files'] != null
          ? List<MaterialFile>.from(
              json['files'].map((x) => MaterialFile.fromJson(x)),
            )
          : [],
      stream: json['stream'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "grade_id": gradeId,
      "division_id": divisionId,
      "stream_id": streamId,
      "subject_id": subjectId,
      "module": module,
      "visibility": visibility,
      "uploaded_by": uploadedBy,
      "is_notified": isNotified,
      "created_at": createdAt,
      "updated_at": updatedAt,
      "grade": grade?.toJson(),
      "division": division?.toJson(),
      "subject": subject?.toJson(),
      "files": files.map((x) => x.toJson()).toList(),
      "stream": stream,
    };
  }
}

class Grade {
  final int id;
  final String gradeName;
  final int isStream;
  final int status;
  final int createdBy;
  final String createdAt;
  final String updatedAt;

  Grade({
    required this.id,
    required this.gradeName,
    required this.isStream,
    required this.status,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Grade.fromJson(Map<String, dynamic> json) {
    return Grade(
      id: json['id'] ?? 0,
      gradeName: json['grade_name'] ?? '',
      isStream: json['is_stream'] ?? 0,
      status: json['status'] ?? 0,
      createdBy: json['created_by'] ?? 0,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "grade_name": gradeName,
      "is_stream": isStream,
      "status": status,
      "created_by": createdBy,
      "created_at": createdAt,
      "updated_at": updatedAt,
    };
  }
}

class Division {
  final int id;
  final String divisionName;
  final int status;
  final int createdBy;
  final String createdAt;
  final String updatedAt;

  Division({
    required this.id,
    required this.divisionName,
    required this.status,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Division.fromJson(Map<String, dynamic> json) {
    return Division(
      id: json['id'] ?? 0,
      divisionName: json['division_name'] ?? '',
      status: json['status'] ?? 0,
      createdBy: json['created_by'] ?? 0,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "division_name": divisionName,
      "status": status,
      "created_by": createdBy,
      "created_at": createdAt,
      "updated_at": updatedAt,
    };
  }
}

class Subject {
  final int id;
  final String subjectsName;
  final String subjectType;
  final int status;
  final int? createdBy;
  final int? updatedBy;
  final String createdAt;
  final String updatedAt;

  Subject({
    required this.id,
    required this.subjectsName,
    required this.subjectType,
    required this.status,
    this.createdBy,
    this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      id: json['id'] ?? 0,
      subjectsName: json['subjects_name'] ?? '',
      subjectType: json['subject_type'] ?? '',
      status: json['status'] ?? 0,
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "subjects_name": subjectsName,
      "subject_type": subjectType,
      "status": status,
      "created_by": createdBy,
      "updated_by": updatedBy,
      "created_at": createdAt,
      "updated_at": updatedAt,
    };
  }
}

class MaterialFile {
  final int id;
  final int studyMaterialId;
  final String filePath;
  final String originalName;
  final int fileSize;
  final String createdAt;
  final String updatedAt;

  MaterialFile({
    required this.id,
    required this.studyMaterialId,
    required this.filePath,
    required this.originalName,
    required this.fileSize,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MaterialFile.fromJson(Map<String, dynamic> json) {
    return MaterialFile(
      id: json['id'] ?? 0,
      studyMaterialId: json['study_material_id'] ?? 0,
      filePath: json['file_path'] ?? '',
      originalName: json['original_name'] ?? '',
      fileSize: json['file_size'] ?? 0,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "study_material_id": studyMaterialId,
      "file_path": filePath,
      "original_name": originalName,
      "file_size": fileSize,
      "created_at": createdAt,
      "updated_at": updatedAt,
    };
  }
}
