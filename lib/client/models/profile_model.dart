class ProfileModel {
  const ProfileModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.firstName,
    this.lastName,
    this.phone,
    this.avatarFileId,
    this.location,
    this.birthdate,
  });

  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final String? firstName;
  final String? lastName;
  final String? phone;
  final String? avatarFileId;
  final String? location;
  final String? birthdate;

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      phone: json['phone'] as String?,
      avatarFileId: json['avatar_file_id'] as String?,
      location: json['location'] as String?,
      birthdate: json['birthdate'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (firstName != null && firstName!.isNotEmpty) {
      map['first_name'] = firstName;
    }
    if (lastName != null && lastName!.isNotEmpty) map['last_name'] = lastName;
    if (phone != null && phone!.isNotEmpty) map['phone'] = phone;
    if (avatarFileId != null && avatarFileId!.isNotEmpty) {
      map['avatar_file_id'] = avatarFileId;
    }
    if (location != null && location!.isNotEmpty) map['location'] = location;
    if (birthdate != null && birthdate!.isNotEmpty) {
      map['birthdate'] = birthdate;
    }
    return map;
  }
}
