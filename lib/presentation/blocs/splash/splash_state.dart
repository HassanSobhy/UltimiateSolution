part of 'splash_bloc.dart';

sealed class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [identityHashCode(this)];
}

final class SplashInitial extends SplashState {}

final class GetUserInfoState extends SplashState {
  final User user;

  const GetUserInfoState({
    required this.user,
  });
}