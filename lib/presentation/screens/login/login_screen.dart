import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ultimate_solutions_task/config/route/routes_manager.dart';
import 'package:ultimate_solutions_task/config/theme/color_manager.dart';
import 'package:ultimate_solutions_task/core/base/widget/base_stateful_widget.dart';
import 'package:ultimate_solutions_task/core/resources/image_manager.dart';
import 'package:ultimate_solutions_task/core/utils/dialogs/show_language_dialog.dart';
import 'package:ultimate_solutions_task/core/utils/show_snack_bar.dart';
import 'package:ultimate_solutions_task/di/injector.dart';
import 'package:ultimate_solutions_task/domain/usecases/get_language_use_case.dart';
import 'package:ultimate_solutions_task/generated/l10n.dart';
import 'package:ultimate_solutions_task/presentation/blocs/login/login_bloc.dart';
import 'package:ultimate_solutions_task/presentation/screens/login/widgets/custom_text_field_widget.dart';
import 'package:ultimate_solutions_task/presentation/screens/login/widgets/password_text_field_widget.dart';
import 'package:ultimate_solutions_task/presentation/widgets/custom_button_widget.dart';
import 'package:ultimate_solutions_task/presentation/widgets/restart_widget.dart';

class LoginScreen extends BaseStatefulWidget {
  const LoginScreen({super.key});

  @override
  BaseState<LoginScreen> baseCreateState() => _LoginScreenState();
}

class _LoginScreenState extends BaseState<LoginScreen> {
  LoginBloc get _bloc => BlocProvider.of<LoginBloc>(context);

  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _userIdErrorMessage;
  String? _passwordErrorMessage;

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is ShowLoadingState) {
          showLoading();
        } else if (state is HideLoadingState) {
          hideLoading();
        } else if (state is InValidUserIdState) {
          _userIdErrorMessage = state.message;
        } else if (state is ValidUserIdState) {
          _userIdErrorMessage = null;
        } else if (state is InValidPasswordState) {
          _passwordErrorMessage = state.message;
        } else if (state is ValidPasswordState) {
          _passwordErrorMessage = null;
        } else if (state is LoginSuccessState) {
          _navigateToOrdersScreen();
        } else if (state is LoginErrorState) {
          showSnackBar(
            context: context,
            message: state.message,
            color: ColorManager.snackBarError,
            icon: ImageManager.error
          );
        } else if (state is ChangeLanguageState) {
          _restartApp();
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 56,
                          ),
                          SvgPicture.asset(
                            ImageManager.loginLogo,
                            fit: BoxFit.scaleDown,
                          ),
                        ],
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SvgPicture.asset(
                          matchTextDirection: true,
                          ImageManager.redCircle,
                        ),
                        Positioned.directional(
                          textDirection: Directionality.of(context),
                          end: 16,
                          child: InkWell(
                            onTap: () {
                              String language = GetLanguageUseCase(injector())();
                              showLanguageDialog(
                                context: context,
                                languageCode: language,
                                onLanguageSelected: (String languageCode) {
                                  if(language == languageCode) return;
                                  _bloc.add(ChangeLanguageEvent(
                                      languageCode: languageCode));
                                },
                              );
                            },
                            child: SvgPicture.asset(
                              ImageManager.language,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 96,
                ),
                Text(
                  S.of(context).welcomeBack,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 29,
                      ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  S.of(context).logBackIntoYourAccount,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const SizedBox(
                  height: 48,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CustomTextFieldWidget(
                    controller: _userIdController,
                    labelText: S.of(context).userId,
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    onChange: (value) {
                      _bloc.add(
                        ValidateUserIdEvent(userId: value),
                      );
                    },
                    errorMessage: _userIdErrorMessage,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: PasswordTextFieldWidget(
                    controller: _passwordController,
                    labelText: S.of(context).password,
                    onChange: (value) {
                      _bloc.add(
                        ValidatePasswordEvent(password: value),
                      );
                    },
                    errorMessage: _passwordErrorMessage,
                    textInputType: TextInputType.text,
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Row(
                    children: [
                      const Expanded(child: SizedBox()),
                      Text(
                        S.of(context).showMore,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: CustomButtonWidget(
                    height: 48,
                    onTap: () {
                      _bloc.add(
                        LoginRequestEvent(
                          userId: _userIdController.text.trim().toString(),
                          password: _passwordController.text.trim().toString(),
                        ),
                      );
                    },
                    text: S.of(context).logIn,
                    backgroundColor: ColorManager.primary,
                    width: double.infinity,
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                SvgPicture.asset(ImageManager.delivery),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _navigateToOrdersScreen() {
    Navigator.pushReplacementNamed(context, Routes.orders);
  }

  void _restartApp() {
    RestartWidget.restartApp(context);
  }

  @override
  void dispose() {
    super.dispose();
    _userIdController.dispose();
    _passwordController.dispose();
  }
}
