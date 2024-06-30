import 'package:ultimate_solutions_task/presentation/blocs/login/login_bloc.dart';

class ValidateLoginFormUseCase {
  List<LoginValidationState> call(
      String userId,
      String password,
      ) {
    final List<LoginValidationState> states = [];
    if (userId.isEmpty) {
      states.add(LoginValidationState.EmptyUserId);
    }  else {
      states.add(LoginValidationState.ValidUserId);
    }
    if (password.isEmpty) {
      states.add(LoginValidationState.EmptyPassword);
    } else {
      states.add(LoginValidationState.ValidPassword);
    }
    return states;
  }
}
