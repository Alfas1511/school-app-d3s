class Student {
  final int id;
  final String admissionNo;
  final String firstName;
  final String lastName;
  final String admissionDate;
  final String dob;
  final String gender;

  Student({
    required this.id,
    required this.admissionNo,
    required this.firstName,
    required this.lastName,
    required this.admissionDate,
    required this.dob,
    required this.gender,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      admissionNo: json['admission_no'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      admissionDate: json['admission_date'],
      dob: json['dob'],
      gender: json['gender'],
    );
  }
}
