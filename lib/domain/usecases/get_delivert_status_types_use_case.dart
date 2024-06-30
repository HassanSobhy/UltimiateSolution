import 'package:ultimate_solutions_task/core/resources/data_state.dart';
import 'package:ultimate_solutions_task/data/sources/remote/yemensoft/orders/request/status_request.dart';
import 'package:ultimate_solutions_task/domain/entities/orders/status_types.dart';
import 'package:ultimate_solutions_task/domain/repositories/orders_repository.dart';

class GetDeliveryStatusTypesUseCase {
  final OrdersRepository _ordersRepository;

  const GetDeliveryStatusTypesUseCase(this._ordersRepository);

  Future<DataState<StatusTypes>> call(StatusRequest request) async {
    return await _ordersRepository.getStatusTypes(request);
  }
}
