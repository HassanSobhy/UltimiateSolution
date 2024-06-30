// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_status_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteStatusType _$RemoteStatusTypeFromJson(Map<String, dynamic> json) =>
    RemoteStatusType(
      name: json['TYP_NM'] as String? ?? '',
      number: json['TYP_NO'] as String? ?? '',
    );

Map<String, dynamic> _$RemoteStatusTypeToJson(RemoteStatusType instance) =>
    <String, dynamic>{
      'TYP_NM': instance.name,
      'TYP_NO': instance.number,
    };
