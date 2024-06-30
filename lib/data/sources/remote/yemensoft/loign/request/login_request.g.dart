// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) => LoginRequest(
      language: json['P_LANG_NO'] as String,
      userId: json['P_DLVRY_NO'] as String,
      password: json['P_PSSWRD'] as String,
    );

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{
      'P_LANG_NO': instance.language,
      'P_DLVRY_NO': instance.userId,
      'P_PSSWRD': instance.password,
    };
