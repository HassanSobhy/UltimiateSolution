import 'package:ultimate_solutions_task/core/resources/data_state.dart';
import 'package:ultimate_solutions_task/data/sources/remote/yemensoft/orders/request/orders_request.dart';
import 'package:ultimate_solutions_task/data/sources/remote/yemensoft/orders/request/status_request.dart';
import 'package:ultimate_solutions_task/domain/entities/orders/order.dart';
import 'package:ultimate_solutions_task/domain/entities/orders/orders.dart';
import 'package:ultimate_solutions_task/domain/entities/orders/status_type.dart';
import 'package:ultimate_solutions_task/domain/entities/orders/status_types.dart';

abstract class OrdersRepository {
  Future<DataState<StatusTypes>> getStatusTypes(
    StatusRequest statusRequest,
  );

  Future<DataState<Orders>> getOrders(
    OrdersRequest ordersRequest,
  );

  // New methods for local storage
  Future<void> saveOrders(List<Order> orders);

  Future<void> saveStatusTypesLocal(List<StatusType> statusTypes);

  Future<List<Order>> getOrdersLocal();

  Future<List<StatusType>> getStatusTypesLocal();
}
