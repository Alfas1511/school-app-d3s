class AnecdotalCategoryModel {
  final bool status;
  final String message;
  final List<String> data;

  AnecdotalCategoryModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AnecdotalCategoryModel.fromJson(Map<String, dynamic> json) {
    return AnecdotalCategoryModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: List<String>.from(json['data'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {'status': status, 'message': message, 'data': data};
  }
}
