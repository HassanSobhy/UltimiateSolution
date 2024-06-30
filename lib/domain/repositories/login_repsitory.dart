import 'package:ultimate_solutions_task/core/resources/data_state.dart';
import 'package:ultimate_solutions_task/data/sources/remote/yemensoft/loign/request/login_request.dart';
import 'package:ultimate_solutions_task/domain/entities/login/user.dart';

abstract class LoginRepository {
  Future<DataState<User>> login(
    LoginRequest loginRequest,
  );
}
