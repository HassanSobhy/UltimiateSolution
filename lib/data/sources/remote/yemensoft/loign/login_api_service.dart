import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ultimate_solutions_task/data/sources/remote/yemensoft/api_keys.dart';
import 'package:ultimate_solutions_task/data/sources/remote/yemensoft/loign/remote/remote_user.dart';
import 'package:ultimate_solutions_task/data/sources/remote/yemensoft/loign/request/login_request.dart';
import 'package:ultimate_solutions_task/data/sources/remote/yemensoft/yemen_soft_request.dart';
import 'package:ultimate_solutions_task/data/sources/remote/yemensoft/yemen_soft_response.dart';

part 'login_api_service.g.dart';

@RestApi()
abstract class LoginApiService {
  factory LoginApiService(Dio dio) = _LoginApiService;

  @POST(APIKeys.login)
  Future<HttpResponse<YemenSoftResponse<RemoteUser>>> login(
      @Body() YemenSoftRequest<LoginRequest> request);
}
