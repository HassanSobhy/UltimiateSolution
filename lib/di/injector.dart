import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ultimate_solutions_task/core/utils/connectivity_service.dart';
import 'package:ultimate_solutions_task/data/repositories/login_repository_implementation.dart';
import 'package:ultimate_solutions_task/data/repositories/orders_repository_implementation.dart';
import 'package:ultimate_solutions_task/data/sources/local/database_helper.dart';
import 'package:ultimate_solutions_task/data/sources/remote/yemensoft/api_keys.dart';
import 'package:ultimate_solutions_task/data/sources/remote/yemensoft/loign/login_api_service.dart';
import 'package:ultimate_solutions_task/data/sources/remote/yemensoft/orders/orders_api_service.dart';
import 'package:ultimate_solutions_task/domain/repositories/login_repsitory.dart';
import 'package:ultimate_solutions_task/domain/repositories/orders_repository.dart';
import 'package:ultimate_solutions_task/domain/usecases/get_delivert_status_types_use_case.dart';
import 'package:ultimate_solutions_task/domain/usecases/get_language_use_case.dart';
import 'package:ultimate_solutions_task/domain/usecases/get_orders_use_case.dart';
import 'package:ultimate_solutions_task/domain/usecases/get_user_id_use_case.dart';
import 'package:ultimate_solutions_task/domain/usecases/get_user_use_case.dart';
import 'package:ultimate_solutions_task/domain/usecases/login_use_case.dart';
import 'package:ultimate_solutions_task/domain/usecases/save_user_id_use_case.dart';
import 'package:ultimate_solutions_task/domain/usecases/save_user_use_case.dart';
import 'package:ultimate_solutions_task/domain/usecases/set_language_use_case.dart';
import 'package:ultimate_solutions_task/domain/usecases/validate_login_form_use_case.dart';
import 'package:ultimate_solutions_task/domain/usecases/validate_password_use_case.dart';
import 'package:ultimate_solutions_task/domain/usecases/validate_user_id_use_case.dart';
import 'package:ultimate_solutions_task/presentation/blocs/login/login_bloc.dart';
import 'package:ultimate_solutions_task/presentation/blocs/main/main_cubit.dart';
import 'package:ultimate_solutions_task/presentation/blocs/orders/orders_bloc.dart';
import 'package:ultimate_solutions_task/presentation/blocs/splash/splash_bloc.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  injector.registerLazySingleton(() => Dio()
    ..options.baseUrl = APIKeys.baseUrl
    ..interceptors.add(PrettyDioLogger(
      requestHeader: false,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    )));
  //Utils
  injector
      .registerLazySingleton<ConnectivityService>(() => ConnectivityService());

  //Local
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  injector.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  injector.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  //Service
  injector.registerFactory<LoginApiService>(
    () => LoginApiService(injector()),
  );

  injector.registerFactory<OrdersAPIService>(
    () => OrdersAPIService(injector()),
  );

  //Repository
  injector.registerFactory<LoginRepository>(
    () => LoginRepositoryImplementation(
      injector(),
    ),
  );

  injector.registerFactory<OrdersRepository>(
    () => OrdersRepositoryImplementation(
      injector(),
      injector(),
      injector(),
    ),
  );

  //Blocs
  injector.registerFactory<MainCubit>(() => MainCubit(
        injector(),
        injector(),
      ));

  injector.registerFactory<SplashBloc>(() => SplashBloc(
        injector(),
      ));

  //Blocs
  injector.registerFactory<LoginBloc>(() => LoginBloc(
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
      ));

  injector.registerFactory<OrdersBloc>(() => OrdersBloc(
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
      ));

  //Use Cases
  injector.registerFactory<SetLanguageUseCase>(
    () => SetLanguageUseCase(injector()),
  );

  injector.registerFactory<GetLanguageUseCase>(
    () => GetLanguageUseCase(injector()),
  );

  injector.registerFactory<LoginUseCase>(
    () => LoginUseCase(injector()),
  );

  injector
      .registerFactory<ValidateUserIdUseCase>(() => ValidateUserIdUseCase());

  injector.registerFactory<ValidatePasswordUseCase>(
      () => ValidatePasswordUseCase());

  injector.registerFactory<ValidateLoginFormUseCase>(
      () => ValidateLoginFormUseCase());

  injector.registerFactory<SaveUserUseCase>(
    () => SaveUserUseCase(injector()),
  );

  injector.registerFactory<GetUserUseCase>(
    () => GetUserUseCase(injector()),
  );

  injector.registerFactory<SaveUserIdUseCase>(
    () => SaveUserIdUseCase(injector()),
  );
  injector.registerFactory<GetUserIdUseCase>(
    () => GetUserIdUseCase(injector()),
  );

  injector.registerFactory<GetDeliveryStatusTypesUseCase>(
    () => GetDeliveryStatusTypesUseCase(injector()),
  );

  injector.registerFactory<GetOrdersUseCase>(
    () => GetOrdersUseCase(injector()),
  );
}
