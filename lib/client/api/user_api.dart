import '/client/api_client.dart';
import '/client/api_result.dart' show ApiResult;
import '/client/models/profile_model.dart';
import '/client/response_sender.dart';

class UserApi {
  UserApi._();

  static final _sender = ResponseSender(ApiClient());

  static Future<ApiResult<Map<String, dynamic>>> updateProfile(
    ProfileModel profile,
  ) async {
    return _sender.patch<Map<String, dynamic>>(
      '/api/users/profile',
      data: profile.toJson(),
      fromJson: (d) => Map<String, dynamic>.from(d as Map),
    );
  }
}
