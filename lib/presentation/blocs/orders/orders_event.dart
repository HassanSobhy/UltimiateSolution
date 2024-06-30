part of 'orders_bloc.dart';

sealed class OrdersEvent extends Equatable {
  const OrdersEvent();

  @override
  List<Object> get props => [
        identityHashCode(this),
      ];
}

class GetUserInfoEvent extends OrdersEvent {}

class GetStatusTypesEvent extends OrdersEvent {}

class GetOrdersEvent extends OrdersEvent {}

class ChangeLanguageEvent extends OrdersEvent {
  final String languageCode;

  const ChangeLanguageEvent({
    required this.languageCode,
  });
}

class ChangeOrderTypeEvent extends OrdersEvent {
  final String orderType;

  const ChangeOrderTypeEvent({
    required this.orderType,
  });
}
