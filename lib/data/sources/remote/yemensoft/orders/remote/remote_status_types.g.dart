// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_status_types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteStatusTypes _$RemoteStatusTypesFromJson(Map<String, dynamic> json) =>
    RemoteStatusTypes(
      statusTypes: (json['DeliveryStatusTypes'] as List<dynamic>?)
              ?.map((e) => RemoteStatusType.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$RemoteStatusTypesToJson(RemoteStatusTypes instance) =>
    <String, dynamic>{
      'DeliveryStatusTypes': instance.statusTypes,
    };
