part of 'splash_bloc.dart';

sealed class SplashEvent extends Equatable {
  const SplashEvent();

  @override
  List<Object> get props => [identityHashCode(this)];
}

final class GetUserInfoEvent extends SplashEvent {}
