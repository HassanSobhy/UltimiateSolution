import 'package:json_annotation/json_annotation.dart';
import 'package:ultimate_solutions_task/data/sources/remote/yemensoft/orders/remote/remote_order.dart';
import 'package:ultimate_solutions_task/domain/entities/orders/orders.dart';

part 'remote_orders.g.dart';

@JsonSerializable()
class RemoteOrders {
  @JsonKey(name: 'DeliveryBills')
  final List<RemoteOrder>? orders;

  const RemoteOrders({
    this.orders = const [],
  });

  factory RemoteOrders.fromJson(Map<String, dynamic> json) =>
      _$RemoteOrdersFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteOrdersToJson(this);

}

extension RemoteOrdersExtension on RemoteOrders? {
  Orders mapToDomain() {
    return Orders(
      orders: this?.orders?.map((e) => e.mapToDomain()).toList() ?? [],
    );
  }
}
