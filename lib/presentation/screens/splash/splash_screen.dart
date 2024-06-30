import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ultimate_solutions_task/config/route/routes_manager.dart';
import 'package:ultimate_solutions_task/config/theme/color_manager.dart';
import 'package:ultimate_solutions_task/core/resources/image_manager.dart';
import 'package:ultimate_solutions_task/presentation/blocs/splash/splash_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashBloc get _bloc => BlocProvider.of<SplashBloc>(context);

  @override
  void initState() {
    super.initState();
    _bloc.add(GetUserInfoEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashBloc, SplashState>(
      listener: (context, state) async {
        if(state is GetUserInfoState) {
          await _delayNavigation();
          if(state.user.name.isEmpty) {
            _navigateToLogin();
          } else {
            _navigateToOrders();
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorManager.splashBackground,
          body: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              Positioned(
                bottom: 48,
                child: SvgPicture.asset(
                  ImageManager.splashBackground,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 16,
                child: SvgPicture.asset(
                  ImageManager.splashDelivery,
                ),
              ),
              Positioned(
                top: 210,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: SvgPicture.asset(
                    ImageManager.logo,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _delayNavigation() async {
    await Future.delayed(const Duration(seconds: 3));
  }

  void _navigateToLogin() {
    Navigator.pushReplacementNamed(context, Routes.login);
  }

  void _navigateToOrders() {
    Navigator.pushReplacementNamed(context, Routes.orders);
  }
}
