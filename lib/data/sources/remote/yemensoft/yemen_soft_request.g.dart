// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yemen_soft_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YemenSoftRequest<T> _$YemenSoftRequestFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    YemenSoftRequest<T>(
      value: _$nullableGenericFromJson(json['Value'], fromJsonT),
    );

Map<String, dynamic> _$YemenSoftRequestToJson<T>(
  YemenSoftRequest<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'Value': _$nullableGenericToJson(instance.value, toJsonT),
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
