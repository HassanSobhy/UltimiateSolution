part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [
        identityHashCode(this),
      ];
}

class LoginRequestEvent extends LoginEvent {
  final String userId;
  final String password;

  const LoginRequestEvent({
    required this.userId,
    required this.password,
  });
}

class ChangeLanguageEvent extends LoginEvent {
  final String languageCode;

  const ChangeLanguageEvent({
    required this.languageCode,
  });
}

class ValidateUserIdEvent extends LoginEvent {
  final String userId;

  const ValidateUserIdEvent({
    required this.userId,
  });
}

class ValidatePasswordEvent extends LoginEvent {
  final String password;

  const ValidatePasswordEvent({
    required this.password,
  });
}
