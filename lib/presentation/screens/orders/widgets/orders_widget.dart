import 'package:flutter/material.dart';
import 'package:ultimate_solutions_task/domain/entities/orders/order.dart';
import 'package:ultimate_solutions_task/domain/entities/orders/status_type.dart';
import 'package:ultimate_solutions_task/presentation/screens/orders/widgets/empty_widget.dart';
import 'package:ultimate_solutions_task/presentation/screens/orders/widgets/order_widget.dart';

class OrdersWidget extends StatelessWidget {
  final List<Order> orders;
  final List<StatusType> statusTypes;
  final String orderType;

  const OrdersWidget({
    super.key,
    required this.orders,
    required this.statusTypes,
    required this.orderType,
  });

  @override
  Widget build(BuildContext context) {
    return orders.isNotEmpty ? SliverList.separated(
      itemCount: orders.length,
      separatorBuilder: (context, index) {
        return const SizedBox(height: 16);
      },
      itemBuilder: (context, index) {
        return OrderWidget(
          order: orders[index],
          orderType: orderType,
          statusTypes: statusTypes,
        );
      },
    ) : const SliverToBoxAdapter(child:  EmptyWidget());
  }
}
