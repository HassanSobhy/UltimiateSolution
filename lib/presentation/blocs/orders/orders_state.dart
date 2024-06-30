part of 'orders_bloc.dart';

sealed class OrdersState extends Equatable {
  const OrdersState();

  @override
  List<Object> get props => [
        identityHashCode(this),
      ];
}

final class OrdersInitial extends OrdersState {}

final class ShowSkeletonState extends OrdersState {}

final class ShowLoadingState extends OrdersState {}

final class HideLoadingState extends OrdersState {}

final class GetUserInfoState extends OrdersState {
  final User user;

  const GetUserInfoState({
    required this.user,
  });
}

final class GetStatusTypesSuccessState extends OrdersState {
  final List<StatusType> statusTypes;

  const GetStatusTypesSuccessState({
    required this.statusTypes,
  });
}

final class GetStatusTypesErrorState extends OrdersState {
  final String message;

  const GetStatusTypesErrorState({
    required this.message,
  });
}

final class GetOrdersSuccessState extends OrdersState {
  final List<Order> orders;

  const GetOrdersSuccessState({
    required this.orders,
  });
}

final class GetOrdersErrorState extends OrdersState {
  final String message;

  const GetOrdersErrorState({
    required this.message,
  });
}

final class ChangeLanguageState extends OrdersState {
  final String language;

  const ChangeLanguageState({
    required this.language,
  });
}

final class ChangeOrderTypeState extends OrdersState {
  final String orderType;

  const ChangeOrderTypeState({
    required this.orderType,
  });
}
