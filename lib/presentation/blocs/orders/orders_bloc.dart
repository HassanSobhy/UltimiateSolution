import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ultimate_solutions_task/core/resources/data_state.dart';
import 'package:ultimate_solutions_task/core/utils/extensions.dart';
import 'package:ultimate_solutions_task/data/sources/remote/yemensoft/orders/request/orders_request.dart';
import 'package:ultimate_solutions_task/data/sources/remote/yemensoft/orders/request/status_request.dart';
import 'package:ultimate_solutions_task/domain/entities/login/user.dart';
import 'package:ultimate_solutions_task/domain/entities/orders/order.dart';
import 'package:ultimate_solutions_task/domain/entities/orders/orders.dart';
import 'package:ultimate_solutions_task/domain/entities/orders/status_type.dart';
import 'package:ultimate_solutions_task/domain/entities/orders/status_types.dart';
import 'package:ultimate_solutions_task/domain/usecases/get_delivert_status_types_use_case.dart';
import 'package:ultimate_solutions_task/domain/usecases/get_language_use_case.dart';
import 'package:ultimate_solutions_task/domain/usecases/get_orders_use_case.dart';
import 'package:ultimate_solutions_task/domain/usecases/get_user_use_case.dart';
import 'package:ultimate_solutions_task/domain/usecases/set_language_use_case.dart';

part 'orders_event.dart';

part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final GetDeliveryStatusTypesUseCase _getDeliveryStatusTypesUseCase;
  final GetOrdersUseCase _getOrdersUseCase;
  final GetUserUseCase _getUserUseCase;
  final GetLanguageUseCase _getLanguageUseCase;
  final SetLanguageUseCase _setLanguageUseCase;

  OrdersBloc(
    this._getDeliveryStatusTypesUseCase,
    this._getOrdersUseCase,
    this._getUserUseCase,
    this._getLanguageUseCase,
    this._setLanguageUseCase,
  ) : super(OrdersInitial()) {
    on<OrdersEvent>((event, emit) async {
      if (event is GetUserInfoEvent) {
        _onGetUserInfoEvent(event, emit);
      } else if (event is GetStatusTypesEvent) {
        await _onGetStatusTypesEvent(event, emit);
      } else if (event is GetOrdersEvent) {
        await _onGetOrdersEvent(event, emit);
      } else if (event is ChangeLanguageEvent)  {
        await _setLanguageUseCase(event.languageCode);
        emit(ChangeLanguageState(language: event.languageCode));
      } else if (event is ChangeOrderTypeEvent) {
        emit(ChangeOrderTypeState(orderType: event.orderType));
      }
    });
  }

  void _onGetUserInfoEvent(GetUserInfoEvent event, Emitter<OrdersState> emit) {
    final User user = _getUserUseCase();
    emit(GetUserInfoState(user: user));
  }

  Future<void> _onGetStatusTypesEvent(
      GetStatusTypesEvent event, Emitter<OrdersState> emit) async {
    emit(ShowLoadingState());
    final DataState<StatusTypes> dataState =
        await _getDeliveryStatusTypesUseCase(
      StatusRequest(language: _getLanguageUseCase().getLanguageCode()),
    );

    if (dataState is DataSuccess) {
      emit(GetStatusTypesSuccessState(
          statusTypes: dataState.data?.statusTypes ?? []));
    } else {
      emit(GetStatusTypesErrorState(
        message: dataState.message ?? "",
      ));
    }

    emit(HideLoadingState());
  }

  Future<void> _onGetOrdersEvent(
      OrdersEvent event, Emitter<OrdersState> emit) async {
    emit(ShowLoadingState());
    final DataState<Orders> dataState = await _getOrdersUseCase(OrdersRequest(
        language: _getLanguageUseCase().getLanguageCode(),
        userId: "1010",
        serial: "",
        flag: ""));

    if (dataState is DataSuccess) {
      emit(GetOrdersSuccessState(orders: dataState.data?.orders ?? []));
    } else {
      emit(GetOrdersErrorState(
        message: dataState.message ?? "",
      ));
    }
    emit(HideLoadingState());
  }
}
