part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [
        identityHashCode(this),
      ];
}

final class LoginInitial extends LoginState {}

final class ShowLoadingState extends LoginState {}

final class HideLoadingState extends LoginState {}

final class ValidUserIdState extends LoginState {}

final class InValidUserIdState extends LoginState {
  final String message;

  const InValidUserIdState({
    required this.message,
  });
}

final class ValidPasswordState extends LoginState {}

final class InValidPasswordState extends LoginState {
  final String message;

  const InValidPasswordState({
    required this.message,
  });
}

final class LoginSuccessState extends LoginState {}

final class LoginErrorState extends LoginState {
  final String message;

  const LoginErrorState({
    required this.message,
  });
}

final class ChangeLanguageState extends LoginState {
  final String languageCode;

  const ChangeLanguageState({
    required this.languageCode,
  });
}
