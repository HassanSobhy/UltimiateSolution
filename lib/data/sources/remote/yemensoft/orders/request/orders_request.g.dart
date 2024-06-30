// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdersRequest _$OrdersRequestFromJson(Map<String, dynamic> json) =>
    OrdersRequest(
      language: json['P_LANG_NO'] as String,
      userId: json['P_DLVRY_NO'] as String,
      serial: json['P_BILL_SRL'] as String,
      flag: json['P_PRCSSD_FLG'] as String,
    );

Map<String, dynamic> _$OrdersRequestToJson(OrdersRequest instance) =>
    <String, dynamic>{
      'P_LANG_NO': instance.language,
      'P_DLVRY_NO': instance.userId,
      'P_BILL_SRL': instance.serial,
      'P_PRCSSD_FLG': instance.flag,
    };
