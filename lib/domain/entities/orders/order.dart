import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final String billAmount;
  final String billDate;
  final String billNumber;
  final String billSerial;
  final String billTime;
  final String billType;
  final String customerAddress;
  final String customerApartmentNumber;
  final String customerBuildingNumber;
  final String customerFloorNumber;
  final String customerName;
  final String deliveryAmount;
  final String deliveryStatusFlag;
  final String latitude;
  final String longitude;
  final String mobileNumber;
  final String regionName;
  final String taxAmount;

  const Order({
    this.billAmount = "",
    this.billDate = "",
    this.billNumber = "",
    this.billSerial = "",
    this.billTime = "",
    this.billType = "",
    this.customerAddress = "",
    this.customerApartmentNumber = "",
    this.customerBuildingNumber = "",
    this.customerFloorNumber = "",
    this.customerName = "",
    this.deliveryAmount = "",
    this.deliveryStatusFlag = "",
    this.latitude = "",
    this.longitude = "",
    this.mobileNumber = "",
    this.regionName = "",
    this.taxAmount = "",
  });

  Map<String, dynamic> toMap() {
    return {
      'billAmount': billAmount,
      'billDate': billDate,
      'billNumber': billNumber,
      'billSerial': billSerial,
      'billTime': billTime,
      'billType': billType,
      'customerAddress': customerAddress,
      'customerApartmentNumber': customerApartmentNumber,
      'customerBuildingNumber': customerBuildingNumber,
      'customerFloorNumber': customerFloorNumber,
      'customerName': customerName,
      'deliveryAmount': deliveryAmount,
      'deliveryStatusFlag': deliveryStatusFlag,
      'latitude': latitude,
      'longitude': longitude,
      'mobileNumber': mobileNumber,
      'regionName': regionName,
      'taxAmount': taxAmount,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      billAmount: map['billAmount'] ?? '',
      billDate: map['billDate'] ?? '',
      billNumber: map['billNumber'] ?? '',
      billSerial: map['billSerial'] ?? '',
      billTime: map['billTime'] ?? '',
      billType: map['billType'] ?? '',
      customerAddress: map['customerAddress'] ?? '',
      customerApartmentNumber: map['customerApartmentNumber'] ?? '',
      customerBuildingNumber: map['customerBuildingNumber'] ?? '',
      customerFloorNumber: map['customerFloorNumber'] ?? '',
      customerName: map['customerName'] ?? '',
      deliveryAmount: map['deliveryAmount'] ?? '',
      deliveryStatusFlag: map['deliveryStatusFlag'] ?? '',
      latitude: map['latitude'] ?? '',
      longitude: map['longitude'] ?? '',
      mobileNumber: map['mobileNumber'] ?? '',
      regionName: map['regionName'] ?? '',
      taxAmount: map['taxAmount'] ?? '',
    );
  }

  @override
  List<Object?> get props => [
        billAmount,
        billDate,
        billNumber,
        billSerial,
        billTime,
        billType,
        customerAddress,
        customerApartmentNumber,
        customerBuildingNumber,
        customerFloorNumber,
        customerName,
        deliveryAmount,
        deliveryStatusFlag,
        latitude,
        longitude,
        mobileNumber,
        regionName,
        taxAmount,
      ];
}
