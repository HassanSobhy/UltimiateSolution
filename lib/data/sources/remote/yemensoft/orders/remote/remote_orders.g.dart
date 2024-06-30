// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_orders.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteOrders _$RemoteOrdersFromJson(Map<String, dynamic> json) => RemoteOrders(
      orders: (json['DeliveryBills'] as List<dynamic>?)
              ?.map((e) => RemoteOrder.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$RemoteOrdersToJson(RemoteOrders instance) =>
    <String, dynamic>{
      'DeliveryBills': instance.orders,
    };
