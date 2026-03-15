import 'base_model.dart';

class UserModel extends BaseModel {
  final String email;

  const UserModel({
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final base = BaseModel.baseFromJson(json);
    return UserModel(
      id: base.id,
      createdAt: base.createdAt,
      updatedAt: base.updatedAt,
      email: json['email'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'email': email};
  }
}
