import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest {
  @JsonKey(name: 'P_LANG_NO')
  final String language;
  @JsonKey(name: 'P_DLVRY_NO')
  final String userId;
  @JsonKey(name: 'P_PSSWRD')
  final String password;

  const LoginRequest({
    required this.language,
    required this.userId,
    required this.password,
  });



  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);

  @override
  String toString() {
    return 'LoginRequest{language: $language, userId: $userId, password: $password}';
  }
}
