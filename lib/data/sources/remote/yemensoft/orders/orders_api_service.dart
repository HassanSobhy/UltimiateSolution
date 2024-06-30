import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ultimate_solutions_task/data/sources/remote/yemensoft/api_keys.dart';
import 'package:ultimate_solutions_task/data/sources/remote/yemensoft/orders/remote/remote_orders.dart';
import 'package:ultimate_solutions_task/data/sources/remote/yemensoft/orders/remote/remote_status_types.dart';
import 'package:ultimate_solutions_task/data/sources/remote/yemensoft/orders/request/orders_request.dart';
import 'package:ultimate_solutions_task/data/sources/remote/yemensoft/orders/request/status_request.dart';
import 'package:ultimate_solutions_task/data/sources/remote/yemensoft/yemen_soft_request.dart';
import 'package:ultimate_solutions_task/data/sources/remote/yemensoft/yemen_soft_response.dart';

part 'orders_api_service.g.dart';

@RestApi()
abstract class OrdersAPIService {
  factory OrdersAPIService(Dio dio) = _OrdersAPIService;

  @POST(APIKeys.bills)
  Future<HttpResponse<YemenSoftResponse<RemoteOrders>>> getOrders(
      @Body() YemenSoftRequest<OrdersRequest> request);

  @POST(APIKeys.statusTypes)
  Future<HttpResponse<YemenSoftResponse<RemoteStatusTypes>>> getDeliveryStatus(
      @Body() YemenSoftRequest<StatusRequest> request);
}
