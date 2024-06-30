import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ultimate_solutions_task/core/resources/data_state.dart';
import 'package:ultimate_solutions_task/core/utils/connectivity_service.dart';
import 'package:ultimate_solutions_task/data/sources/local/database_helper.dart';
import 'package:ultimate_solutions_task/data/sources/remote/yemensoft/orders/orders_api_service.dart';
import 'package:ultimate_solutions_task/data/sources/remote/yemensoft/orders/remote/remote_orders.dart';
import 'package:ultimate_solutions_task/data/sources/remote/yemensoft/orders/remote/remote_status_types.dart';
import 'package:ultimate_solutions_task/data/sources/remote/yemensoft/orders/request/orders_request.dart';
import 'package:ultimate_solutions_task/data/sources/remote/yemensoft/orders/request/status_request.dart';
import 'package:ultimate_solutions_task/data/sources/remote/yemensoft/yemen_soft_request.dart';
import 'package:ultimate_solutions_task/domain/entities/orders/order.dart';
import 'package:ultimate_solutions_task/domain/entities/orders/orders.dart';
import 'package:ultimate_solutions_task/domain/entities/orders/status_type.dart';
import 'package:ultimate_solutions_task/domain/entities/orders/status_types.dart';
import 'package:ultimate_solutions_task/domain/repositories/orders_repository.dart';

class OrdersRepositoryImplementation implements OrdersRepository {
  final OrdersAPIService _ordersAPIService;
  final DatabaseHelper _databaseHelper;
  final ConnectivityService _connectivityService;

  OrdersRepositoryImplementation(
    this._ordersAPIService,
    this._databaseHelper,
    this._connectivityService,
  );

  @override
  Future<DataState<Orders>> getOrders(OrdersRequest ordersRequest) async {
    if ((await _connectivityService.isConnected())) {
      try {
        YemenSoftRequest<OrdersRequest> request =
            YemenSoftRequest<OrdersRequest>(
          value: ordersRequest,
        );
        final httpResponse = await _ordersAPIService.getOrders(request);
        if (httpResponse.response.statusCode == HttpStatus.ok) {
          if (httpResponse.data.result?.errorNumber == 0) {

            Orders orders  = (httpResponse.data.data ?? const RemoteOrders())
                .mapToDomain();
            await saveOrders(orders.orders);
            return DataSuccess(
              data: orders,
              message: httpResponse.data.result?.message ?? "",
            );
          } else {
            return DataFailed(
              message: httpResponse.data.result?.message ?? "",
            );
          }
        }

        return DataFailed(
          message: httpResponse.data.result?.message ?? "",
        );
      } on DioException catch (e) {
        return DataFailed(
          error: e,
          message: "Something went wrong",
        );
      }
    } else {
      final localOrders = await getOrdersLocal();
      if (localOrders.isNotEmpty) {
        return DataSuccess(data: Orders(orders: localOrders));
      } else {
        return DataFailed(
          message: "No internet and no local data available",
        );
      }
    }
  }

  @override
  Future<DataState<StatusTypes>> getStatusTypes(
      StatusRequest statusRequest) async {
    if ((await _connectivityService.isConnected())) {
      try {
        YemenSoftRequest<StatusRequest> request =
            YemenSoftRequest<StatusRequest>(
          value: statusRequest,
        );
        final httpResponse = await _ordersAPIService.getDeliveryStatus(request);
        if (httpResponse.response.statusCode == HttpStatus.ok) {
          if (httpResponse.data.result?.errorNumber == 0) {
            final statusTypes = (httpResponse.data.data ?? const RemoteStatusTypes())
                .mapToDomain();

            // Save status types to local database
            await saveStatusTypesLocal(statusTypes.statusTypes);

            return DataSuccess(
              data: statusTypes,
              message: httpResponse.data.result?.message ?? "",
            );
          } else {
            return DataFailed(
              message: httpResponse.data.result?.message ?? "",
            );
          }
        }

        return DataFailed(
          message: httpResponse.data.result?.message ?? "",
        );
      } on DioException catch (e) {
        return DataFailed(
          error: e,
          message: "Something went wrong",
        );
      }
    } else {
      final localStatusTypes = await getStatusTypesLocal();
      if (localStatusTypes.isNotEmpty) {
        return DataSuccess(data: StatusTypes(statusTypes: localStatusTypes));
      } else {
        return DataFailed(
          message: "No internet and no local data available",
        );
      }
    }
  }

  @override
  Future<List<Order>> getOrdersLocal() async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('orders');
    return List.generate(maps.length, (i) {
      return Order.fromMap(maps[i]);
    });
  }

  @override
  Future<List<StatusType>> getStatusTypesLocal() async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('status_types');
    return List.generate(maps.length, (i) {
      return StatusType.fromMap(maps[i]);
    });
  }

  @override
  Future<void> saveOrders(List<Order> orders) async {
    final db = await _databaseHelper.database;
    await db.transaction((txn) async {
      for (Order order in orders) {
        await txn.insert('orders', order.toMap());
      }
    });
  }

  @override
  Future<void> saveStatusTypesLocal(List<StatusType> statusTypes) async {
    final db = await _databaseHelper.database;
    await db.transaction((txn) async {
      for (StatusType statusType in statusTypes) {
        await txn.insert('status_types', statusType.toMap());
      }
    });
  }
}
