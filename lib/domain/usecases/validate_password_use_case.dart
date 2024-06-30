import 'package:ultimate_solutions_task/presentation/blocs/login/login_bloc.dart';

class ValidatePasswordUseCase {
  PasswordValidationState call(String password) {
    if (password.isEmpty) {
      return PasswordValidationState.EmptyPassword;
    } else {
      return PasswordValidationState.Valid;
    }
  }
}
