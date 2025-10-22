class StudentsList {
  final int id;
  final String admissionNo;
  final String firstName;
  final String lastName;
  final String admissionDate;
  final String dob;
  final String gender;
  final String? studentImage;
  final String? bloodGroup;
  final String? address;
  final String? emergencyContact;
  final String? grade;
  final String? division;

  StudentsList({
    required this.id,
    required this.admissionNo,
    required this.firstName,
    required this.lastName,
    required this.admissionDate,
    required this.dob,
    required this.gender,
    this.studentImage,
    this.bloodGroup,
    this.address,
    this.emergencyContact,
    this.grade,
    this.division,
  });

  factory StudentsList.fromJson(Map<String, dynamic> json) {
    return StudentsList(
      id: json['id'] is int ? json['id'] : int.parse(json['id'].toString()),
      admissionNo: json['admission_no']?.toString() ?? '',
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      admissionDate: json['admission_date']?.toString() ?? '',
      dob: json['dob']?.toString() ?? '',
      gender: json['gender'] ?? '',
      studentImage: json['student_image'],
      bloodGroup: json['blood_group'],
      address: json['address'],
      emergencyContact: json['primary_contact_number'],
      grade: json['grade']?.toString(),
      division: json['division']?.toString(),
    );
  }
}
