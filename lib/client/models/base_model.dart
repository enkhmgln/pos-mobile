abstract class BaseModel {
  const BaseModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String createdAt;
  final String updatedAt;

  static ({String id, String createdAt, String updatedAt}) baseFromJson(
    Map<String, dynamic> json,
  ) {
    return (
      id: json['id'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );
  }
}
