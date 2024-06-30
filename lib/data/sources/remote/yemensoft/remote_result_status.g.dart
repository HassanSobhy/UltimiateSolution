// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_result_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteResultStatus _$RemoteResultStatusFromJson(Map<String, dynamic> json) =>
    RemoteResultStatus(
      message: json['ErrMsg'] as String? ?? "",
      errorNumber: (json['ErrNo'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$RemoteResultStatusToJson(RemoteResultStatus instance) =>
    <String, dynamic>{
      'ErrMsg': instance.message,
      'ErrNo': instance.errorNumber,
    };
