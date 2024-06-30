import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ultimate_solutions_task/config/route/routes_manager.dart';
import 'package:ultimate_solutions_task/config/theme/app_theme.dart';
import 'package:ultimate_solutions_task/core/utils/bloc_observer.dart';
import 'package:ultimate_solutions_task/di/injector.dart';
import 'package:ultimate_solutions_task/generated/l10n.dart';
import 'package:ultimate_solutions_task/presentation/blocs/login/login_bloc.dart';
import 'package:ultimate_solutions_task/presentation/blocs/main/main_cubit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ultimate_solutions_task/presentation/blocs/orders/orders_bloc.dart';
import 'package:ultimate_solutions_task/presentation/blocs/splash/splash_bloc.dart';
import 'package:ultimate_solutions_task/presentation/widgets/restart_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  Bloc.observer = const SimpleBlocObserver();

  runApp(const RestartWidget(MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainCubit>(create: (context) => injector()),
        BlocProvider<SplashBloc>(create: (context) => injector()),
        BlocProvider<LoginBloc>(create: (context) => injector()),
        BlocProvider<OrdersBloc>(create: (context) => injector()),
      ],
      child: BlocBuilder<MainCubit, Locale>(
        buildWhen: (previousState, currentState) {
          return previousState != currentState;
        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Task',
            theme: AppTheme(state.languageCode).light,
            themeMode: ThemeMode.light,
            initialRoute: Routes.splash,
            onGenerateRoute: RoutesManager.getRoute,
            locale: state,
            supportedLocales: S.delegate.supportedLocales,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
          );
        },
      ),
    );
  }
}
