// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yemen_soft_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YemenSoftResponse<T> _$YemenSoftResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    YemenSoftResponse<T>(
      data: _$nullableGenericFromJson(json['Data'], fromJsonT),
      result: json['Result'] == null
          ? null
          : RemoteResultStatus.fromJson(json['Result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$YemenSoftResponseToJson<T>(
  YemenSoftResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'Data': _$nullableGenericToJson(instance.data, toJsonT),
      'Result': instance.result,
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
