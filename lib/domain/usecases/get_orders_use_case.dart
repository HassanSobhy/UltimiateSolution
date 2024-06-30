import 'package:ultimate_solutions_task/core/resources/data_state.dart';
import 'package:ultimate_solutions_task/data/sources/remote/yemensoft/orders/request/orders_request.dart';
import 'package:ultimate_solutions_task/domain/entities/orders/orders.dart';
import 'package:ultimate_solutions_task/domain/repositories/orders_repository.dart';

class GetOrdersUseCase {
  final OrdersRepository _ordersRepository;

  const GetOrdersUseCase(this._ordersRepository);

  Future<DataState<Orders>> call(OrdersRequest request) async {
    return await _ordersRepository.getOrders(request);
  }
}
