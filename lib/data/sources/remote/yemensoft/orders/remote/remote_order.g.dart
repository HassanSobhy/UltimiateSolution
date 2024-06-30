// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteOrder _$RemoteOrderFromJson(Map<String, dynamic> json) => RemoteOrder(
      billAmount: json['BILL_AMT'] as String?,
      billDate: json['BILL_DATE'] as String?,
      billNumber: json['BILL_NO'] as String?,
      billSerial: json['BILL_SRL'] as String?,
      billTime: json['BILL_TIME'] as String?,
      billType: json['BILL_TYPE'] as String?,
      customerAddress: json['CSTMR_ADDRSS'] as String?,
      customerApartmentNumber: json['CSTMR_APRTMNT_NO'] as String?,
      customerBuildingNumber: json['CSTMR_BUILD_NO'] as String?,
      customerFloorNumber: json['CSTMR_FLOOR_NO'] as String?,
      customerName: json['CSTMR_NM'] as String?,
      deliveryAmount: json['DLVRY_AMT'] as String?,
      deliveryStatusFlag: json['DLVRY_STATUS_FLG'] as String?,
      latitude: json['LATITUDE'] as String?,
      longitude: json['LONGITUDE'] as String?,
      mobileNumber: json['MOBILE_NO'] as String?,
      regionName: json['RGN_NM'] as String?,
      taxAmount: json['TAX_AMT'] as String?,
    );

Map<String, dynamic> _$RemoteOrderToJson(RemoteOrder instance) =>
    <String, dynamic>{
      'BILL_AMT': instance.billAmount,
      'BILL_DATE': instance.billDate,
      'BILL_NO': instance.billNumber,
      'BILL_SRL': instance.billSerial,
      'BILL_TIME': instance.billTime,
      'BILL_TYPE': instance.billType,
      'CSTMR_ADDRSS': instance.customerAddress,
      'CSTMR_APRTMNT_NO': instance.customerApartmentNumber,
      'CSTMR_BUILD_NO': instance.customerBuildingNumber,
      'CSTMR_FLOOR_NO': instance.customerFloorNumber,
      'CSTMR_NM': instance.customerName,
      'DLVRY_AMT': instance.deliveryAmount,
      'DLVRY_STATUS_FLG': instance.deliveryStatusFlag,
      'LATITUDE': instance.latitude,
      'LONGITUDE': instance.longitude,
      'MOBILE_NO': instance.mobileNumber,
      'RGN_NM': instance.regionName,
      'TAX_AMT': instance.taxAmount,
    };
