import 'base_model.dart';

class FileModel extends BaseModel {
  final String? userId;
  final String originalName;
  final String storedName;
  final String mimeType;
  final int size;
  final String path;
  final String url;

  const FileModel({
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    this.userId,
    required this.originalName,
    required this.storedName,
    required this.mimeType,
    required this.size,
    required this.path,
    required this.url,
  });

  factory FileModel.fromJson(Map<String, dynamic> json) {
    final base = BaseModel.baseFromJson(json);
    return FileModel(
      id: base.id,
      createdAt: base.createdAt,
      updatedAt: base.updatedAt,
      userId: json['user_id'] as String?,
      originalName: json['original_name'] as String,
      storedName: json['stored_name'] as String,
      mimeType: json['mime_type'] as String,
      size: json['size'] as int,
      path: json['path'] as String,
      url: json['url'] as String,
    );
  }
}
