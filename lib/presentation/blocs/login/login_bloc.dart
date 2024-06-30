import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ultimate_solutions_task/core/resources/data_state.dart';
import 'package:ultimate_solutions_task/core/utils/extensions.dart';
import 'package:ultimate_solutions_task/data/sources/remote/yemensoft/loign/request/login_request.dart';
import 'package:ultimate_solutions_task/domain/entities/login/user.dart';
import 'package:ultimate_solutions_task/domain/usecases/get_language_use_case.dart';
import 'package:ultimate_solutions_task/domain/usecases/login_use_case.dart';
import 'package:ultimate_solutions_task/domain/usecases/save_user_id_use_case.dart';
import 'package:ultimate_solutions_task/domain/usecases/save_user_use_case.dart';
import 'package:ultimate_solutions_task/domain/usecases/set_language_use_case.dart';
import 'package:ultimate_solutions_task/domain/usecases/validate_login_form_use_case.dart';
import 'package:ultimate_solutions_task/domain/usecases/validate_password_use_case.dart';
import 'package:ultimate_solutions_task/domain/usecases/validate_user_id_use_case.dart';
import 'package:ultimate_solutions_task/generated/l10n.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final SetLanguageUseCase _setLanguageUseCase;
  final GetLanguageUseCase _getLanguageUseCase;
  final SaveUserUseCase _saveUserUseCase;
  final LoginUseCase _loginUseCase;
  final ValidateUserIdUseCase _validateUserIdUseCase;
  final ValidatePasswordUseCase _validatePasswordUseCase;
  final ValidateLoginFormUseCase _validateLoginFormUseCase;
  final SaveUserIdUseCase _saveUserIdUseCase;

  LoginBloc(
    this._setLanguageUseCase,
    this._getLanguageUseCase,
    this._saveUserUseCase,
    this._loginUseCase,
    this._validateUserIdUseCase,
    this._validatePasswordUseCase,
    this._validateLoginFormUseCase,
    this._saveUserIdUseCase,
  ) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is ValidateUserIdEvent) {
        _onValidateUserIdEvent(event, emit);
      } else if (event is ValidatePasswordEvent) {
        _onValidatePasswordEvent(event, emit);
      } else if (event is LoginRequestEvent) {
        await _onLoginRequestEvent(emit, event);
      } else if (event is ChangeLanguageEvent) {
        await _setLanguageUseCase(event.languageCode);
        emit(ChangeLanguageState(languageCode: event.languageCode));
      }
    });
  }

  void _onValidateUserIdEvent(
    ValidateUserIdEvent event,
    Emitter<LoginState> emit,
  ) {
    final UserIdValidationState state = _validateUserIdUseCase(event.userId);
    switch (state) {
      case UserIdValidationState.EmptyUserId:
        emit(InValidUserIdState(
          message: S.current.userIdCannotBeEmpty,
        ));
        break;
      case UserIdValidationState.Valid:
        emit(ValidUserIdState());
        break;
    }
  }

  void _onValidatePasswordEvent(
    ValidatePasswordEvent event,
    Emitter<LoginState> emit,
  ) {
    final PasswordValidationState state =
        _validatePasswordUseCase(event.password);
    switch (state) {
      case PasswordValidationState.EmptyPassword:
        emit(InValidPasswordState(
          message: S.current.passwordCannotBeEmpty,
        ));
        break;
      case PasswordValidationState.Valid:
        emit(ValidPasswordState());
        break;
    }
  }

  Future<void> _onLoginRequestEvent(
    Emitter<LoginState> emit,
    LoginRequestEvent event,
  ) async {
    final List<LoginValidationState> states =
        _validateLoginFormUseCase(event.userId, event.password);
    bool isValid = true;
    for (var state in states) {
      switch (state) {
        case LoginValidationState.EmptyUserId:
          emit(InValidUserIdState(
            message: S.current.userIdCannotBeEmpty,
          ));
          isValid = false;
          continue;
        case LoginValidationState.EmptyPassword:
          emit(InValidPasswordState(
            message: S.current.passwordCannotBeEmpty,
          ));
          isValid = false;
          continue;
        case LoginValidationState.ValidUserId:
          emit(ValidUserIdState());
          continue;
        case LoginValidationState.ValidPassword:
          emit(ValidPasswordState());
          continue;
      }
    }
    if (!isValid) return;

    emit(ShowLoadingState());
    final DataState<User> dataState = await _loginUseCase(
      LoginRequest(
        language: _getLanguageUseCase().getLanguageCode(),
        userId: event.userId,
        password: event.password,
      ),
    );

    if (dataState is DataSuccess) {
      await _saveUserUseCase(dataState.data ?? const User());
      await _saveUserIdUseCase(event.userId);
      emit(LoginSuccessState());
    } else {
      emit(LoginErrorState(message: dataState.message ?? ""));
    }

    emit(HideLoadingState());
  }
}

enum UserIdValidationState {
  EmptyUserId,
  Valid,
}

enum PasswordValidationState {
  EmptyPassword,
  Valid,
}

enum LoginValidationState {
  EmptyUserId,
  ValidUserId,
  EmptyPassword,
  ValidPassword,
}
