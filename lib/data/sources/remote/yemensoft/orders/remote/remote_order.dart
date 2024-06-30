import 'package:json_annotation/json_annotation.dart';
import 'package:ultimate_solutions_task/domain/entities/orders/order.dart';

part 'remote_order.g.dart';

@JsonSerializable()
class RemoteOrder {
  @JsonKey(name: 'BILL_AMT')
  final String? billAmount;

  @JsonKey(name: 'BILL_DATE')
  final String? billDate;

  @JsonKey(name: 'BILL_NO')
  final String? billNumber;

  @JsonKey(name: 'BILL_SRL')
  final String? billSerial;

  @JsonKey(name: 'BILL_TIME')
  final String? billTime;

  @JsonKey(name: 'BILL_TYPE')
  final String? billType;

  @JsonKey(name: 'CSTMR_ADDRSS')
  final String? customerAddress;

  @JsonKey(name: 'CSTMR_APRTMNT_NO')
  final String? customerApartmentNumber;

  @JsonKey(name: 'CSTMR_BUILD_NO')
  final String? customerBuildingNumber;

  @JsonKey(name: 'CSTMR_FLOOR_NO')
  final String? customerFloorNumber;

  @JsonKey(name: 'CSTMR_NM')
  final String? customerName;

  @JsonKey(name: 'DLVRY_AMT')
  final String? deliveryAmount;

  @JsonKey(name: 'DLVRY_STATUS_FLG')
  final String? deliveryStatusFlag;

  @JsonKey(name: 'LATITUDE')
  final String? latitude;

  @JsonKey(name: 'LONGITUDE')
  final String? longitude;

  @JsonKey(name: 'MOBILE_NO')
  final String? mobileNumber;

  @JsonKey(name: 'RGN_NM')
  final String? regionName;

  @JsonKey(name: 'TAX_AMT')
  final String? taxAmount;

  const RemoteOrder({
    this.billAmount,
    this.billDate,
    this.billNumber,
    this.billSerial,
    this.billTime,
    this.billType,
    this.customerAddress,
    this.customerApartmentNumber,
    this.customerBuildingNumber,
    this.customerFloorNumber,
    this.customerName,
    this.deliveryAmount,
    this.deliveryStatusFlag,
    this.latitude,
    this.longitude,
    this.mobileNumber,
    this.regionName,
    this.taxAmount,
  });

  factory RemoteOrder.fromJson(Map<String, dynamic> json) => _$RemoteOrderFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteOrderToJson(this);


}


extension RemoteDeliveryBillExtension on RemoteOrder {
  Order mapToDomain() {
    return Order(
      billAmount: billAmount ?? '',
      billDate: billDate ?? '',
      billNumber: billNumber ?? '',
      billSerial: billSerial ?? '',
      billTime: billTime ?? '',
      billType: billType ?? '',
      customerAddress: customerAddress ?? '',
      customerApartmentNumber: customerApartmentNumber ?? '',
      customerBuildingNumber: customerBuildingNumber ?? '',
      customerFloorNumber: customerFloorNumber ?? '',
      customerName: customerName ?? '',
      deliveryAmount: deliveryAmount ?? '',
      deliveryStatusFlag: deliveryStatusFlag ?? '',
      latitude: latitude ?? '',
      longitude: longitude ?? '',
      mobileNumber: mobileNumber ?? '',
      regionName: regionName ?? '',
      taxAmount: taxAmount ?? '',
    );
  }
}

