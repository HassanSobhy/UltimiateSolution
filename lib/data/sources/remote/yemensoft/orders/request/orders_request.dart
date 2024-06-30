import 'package:json_annotation/json_annotation.dart';

part 'orders_request.g.dart';

@JsonSerializable()
class OrdersRequest {
  @JsonKey(name: 'P_LANG_NO')
  final String language;
  @JsonKey(name: 'P_DLVRY_NO')
  final String userId;
  @JsonKey(name: 'P_BILL_SRL')
  final String serial;
  @JsonKey(name: 'P_PRCSSD_FLG')
  final String flag;

  const OrdersRequest({
    required this.language,
    required this.userId,
    required this.serial,
    required this.flag,
  });



  factory OrdersRequest.fromJson(Map<String, dynamic> json) =>
      _$OrdersRequestFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersRequestToJson(this);

  @override
  String toString() {
    return "OrdersRequest{language: $language, userId: $userId, serial: $serial, flag: $flag}";
  }
}
