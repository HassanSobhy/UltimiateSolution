import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ultimate_solutions_task/domain/usecases/get_language_use_case.dart';
import 'package:ultimate_solutions_task/domain/usecases/set_language_use_case.dart';

class MainCubit extends Cubit<Locale> {
  final GetLanguageUseCase _getLanguageUseCase;
  final SetLanguageUseCase _setLanguageUseCase;

  MainCubit(
      this._getLanguageUseCase,
      this._setLanguageUseCase,
      ) : super(Locale(window.locale.languageCode)) {
    getLanguage();
  }

  void getLanguage() async {
    final language = _getLanguageUseCase();
    await _setLanguageUseCase(language);
    emit(Locale(language));
  }
}
