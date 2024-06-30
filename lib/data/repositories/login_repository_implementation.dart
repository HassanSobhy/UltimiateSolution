import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ultimate_solutions_task/core/resources/data_state.dart';
import 'package:ultimate_solutions_task/data/sources/remote/yemensoft/loign/login_api_service.dart';
import 'package:ultimate_solutions_task/data/sources/remote/yemensoft/loign/remote/remote_user.dart';
import 'package:ultimate_solutions_task/data/sources/remote/yemensoft/loign/request/login_request.dart';
import 'package:ultimate_solutions_task/data/sources/remote/yemensoft/yemen_soft_request.dart';
import 'package:ultimate_solutions_task/domain/entities/login/user.dart';
import 'package:ultimate_solutions_task/domain/repositories/login_repsitory.dart';

class LoginRepositoryImplementation implements LoginRepository {
  final LoginApiService _loginApiService;

  LoginRepositoryImplementation(this._loginApiService);

  @override
  Future<DataState<User>> login(LoginRequest loginRequest) async {
    try {
      YemenSoftRequest<LoginRequest> request = YemenSoftRequest<LoginRequest>(
        value: loginRequest,
      );
      final httpResponse = await _loginApiService.login(request);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        if (httpResponse.data.result?.errorNumber == 0) {
          return DataSuccess(
            data: (httpResponse.data.data ?? const RemoteUser()).mapToDomain(),
            message: httpResponse.data.result?.message ?? "",
          );
        } else {
          return DataFailed(
            message: httpResponse.data.result?.message ?? "",
          );
        }
      }

      return DataFailed(
        message: httpResponse.data.result?.message ?? "",
      );
    } on DioException catch (e) {
      return DataFailed(
        error: e,
        message: "Something went wrong",
      );
    }
  }
}
