import 'package:equatable/equatable.dart';
import 'package:ultimate_solutions_task/domain/entities/orders/order.dart';

class Orders extends Equatable {
  final List<Order> orders;

  const Orders({
    this.orders = const [],
  });

  Map<String, dynamic> toMap() {
    return {
      'orders': orders.map((element) => element.toMap()).toList(),
    };
  }

  factory Orders.fromMap(Map<String, dynamic> map) {
    return Orders(
      orders: List<Order>.from(map['orders']?.map((x) => Order.fromMap(x))),
    );
  }

  @override
  List<Object?> get props => [orders];
}
