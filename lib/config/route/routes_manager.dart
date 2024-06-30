import 'package:flutter/material.dart';
import 'package:ultimate_solutions_task/presentation/screens/login/login_screen.dart';
import 'package:ultimate_solutions_task/presentation/screens/orders/orders_screen.dart';
import 'package:ultimate_solutions_task/presentation/screens/splash/splash_screen.dart';

class Routes {
  static const String splash = "/";
  static const String login = "/login";
  static const String orders = "/orders";
}

class RoutesManager {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splash:
        return _materialRoute(
          const SplashScreen(),
        );

      case Routes.login:
        return _materialRoute(
          const LoginScreen(),
        );

      case Routes.orders:
        return _materialRoute(
          const OrdersScreen(),
        );

      default:
        return unDefinedRoute(routeSettings.name ?? "");
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }

  static Route<dynamic> unDefinedRoute(String name) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text("Not found")),
        body: Center(
          child: Text(name),
        ),
      ),
    );
  }
}
