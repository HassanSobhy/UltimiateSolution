import 'package:ultimate_solutions_task/presentation/blocs/login/login_bloc.dart';

class ValidateUserIdUseCase {
  UserIdValidationState call(String userId) {
    if (userId.isEmpty) {
      return UserIdValidationState.EmptyUserId;
    } else {
      return UserIdValidationState.Valid;
    }
  }
}
