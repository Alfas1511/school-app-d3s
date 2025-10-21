class StudentDetailsResponse {
  final bool status;
  final String message;
  final StudentData? data;

  StudentDetailsResponse({
    required this.status,
    required this.message,
    this.data,
  });

  factory StudentDetailsResponse.fromJson(Map<String, dynamic> json) {
    return StudentDetailsResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null ? StudentData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'status': status, 'message': message, 'data': data?.toJson()};
  }
}

class StudentData {
  final int id;
  final String studentImage;
  final String firstName;
  final String lastName;
  final String dob;
  final String bloodGroup;
  final String admissionDate;
  final String aadhaarNo;
  final String grade;
  final String division;
  final String address;
  final String primaryContactNumber;
  final String fatherName;
  final String fatherPhone;
  final String fatherOccupation;
  final String fatherEmail;
  final String motherName;
  final String motherPhone;
  final String motherOccupation;
  final String motherEmail;

  StudentData({
    required this.id,
    required this.studentImage,
    required this.firstName,
    required this.lastName,
    required this.dob,
    required this.bloodGroup,
    required this.admissionDate,
    required this.aadhaarNo,
    required this.grade,
    required this.division,
    required this.address,
    required this.primaryContactNumber,
    required this.fatherName,
    required this.fatherPhone,
    required this.fatherOccupation,
    required this.fatherEmail,
    required this.motherName,
    required this.motherPhone,
    required this.motherOccupation,
    required this.motherEmail,
  });

  factory StudentData.fromJson(Map<String, dynamic> json) {
    return StudentData(
      id: json['id'] ?? 0,
      studentImage: json['student_image'] ?? '',
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      dob: json['dob'] ?? '',
      bloodGroup: json['blood_group'] ?? '',
      admissionDate: json['admission_date'] ?? '',
      aadhaarNo: json['aadhaar_no'] ?? '',
      grade: json['grade'] ?? '',
      division: json['division'] ?? '',
      address: json['address'] ?? '',
      primaryContactNumber: json['primary_contact_number'] ?? '',
      fatherName: json['father_name'] ?? '',
      fatherPhone: json['father_phone'] ?? '',
      fatherOccupation: json['father_occupation'] ?? '',
      fatherEmail: json['father_email'] ?? '',
      motherName: json['mother_name'] ?? '',
      motherPhone: json['mother_phone'] ?? '',
      motherOccupation: json['mother_occupation'] ?? '',
      motherEmail: json['mother_email'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'student_image': studentImage,
      'first_name': firstName,
      'last_name': lastName,
      'dob': dob,
      'blood_group': bloodGroup,
      'admission_date': admissionDate,
      'aadhaar_no': aadhaarNo,
      'grade': grade,
      'division': division,
      'address': address,
      'primary_contact_number': primaryContactNumber,
      'father_name': fatherName,
      'father_phone': fatherPhone,
      'father_occupation': fatherOccupation,
      'father_email': fatherEmail,
      'mother_name': motherName,
      'mother_phone': motherPhone,
      'mother_occupation': motherOccupation,
      'mother_email': motherEmail,
    };
  }
}
