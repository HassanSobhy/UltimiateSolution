import 'package:ultimate_solutions_task/core/resources/data_state.dart';
import 'package:ultimate_solutions_task/data/sources/remote/yemensoft/loign/request/login_request.dart';
import 'package:ultimate_solutions_task/domain/entities/login/user.dart';
import 'package:ultimate_solutions_task/domain/repositories/login_repsitory.dart';

class LoginUseCase {
  final LoginRepository _loginRepository;

  const LoginUseCase(this._loginRepository);

  Future<DataState<User>> call(LoginRequest request) async {
    return await _loginRepository.login(request);
  }
}
