class ParentProfile {
  final int id;
  final String parentPhone;
  final ParentInfo parentInfo;

  ParentProfile({
    required this.id,
    required this.parentPhone,
    required this.parentInfo,
  });

  factory ParentProfile.fromJson(Map<String, dynamic> json) {
    return ParentProfile(
      id: json['id'] is int ? json['id'] : int.parse(json['id'].toString()),
      parentPhone: json['parent_phone'] ?? '',
      parentInfo: ParentInfo.fromJson(json['parent_info'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'parent_phone': parentPhone,
      'parent_info': parentInfo.toJson(),
    };
  }
}

class ParentInfo {
  final String fatherName;
  final String fatherEmail;
  final String fatherOccupation;
  final String? fatherImage;
  final String motherName;
  final String motherEmail;
  final String motherPhone;
  final String motherOccupation;
  final String? motherImage;

  ParentInfo({
    required this.fatherName,
    required this.fatherEmail,
    required this.fatherOccupation,
    this.fatherImage,
    required this.motherName,
    required this.motherEmail,
    required this.motherPhone,
    required this.motherOccupation,
    this.motherImage,
  });

  factory ParentInfo.fromJson(Map<String, dynamic> json) {
    return ParentInfo(
      fatherName: json['father_name'] ?? '',
      fatherEmail: json['father_email'] ?? '',
      fatherOccupation: json['father_occupation'] ?? '',
      fatherImage: json['father_image'],
      motherName: json['mother_name'] ?? '',
      motherEmail: json['mother_email'] ?? '',
      motherPhone: json['mother_phone'] ?? '',
      motherOccupation: json['mother_occupation'] ?? '',
      motherImage: json['mother_image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'father_name': fatherName,
      'father_email': fatherEmail,
      'father_occupation': fatherOccupation,
      'father_image': fatherImage,
      'mother_name': motherName,
      'mother_email': motherEmail,
      'mother_phone': motherPhone,
      'mother_occupation': motherOccupation,
      'mother_image': motherImage,
    };
  }
}
