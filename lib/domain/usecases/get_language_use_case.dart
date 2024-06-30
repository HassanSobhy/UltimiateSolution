import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:ultimate_solutions_task/core/resources/shared_preferences_keys.dart';

class GetLanguageUseCase {
  final SharedPreferences sharedPreferences;

  GetLanguageUseCase(this.sharedPreferences);

  String call() {
    return sharedPreferences.getString(SharedPreferenceKeys.language) ??
        window.locale.languageCode;
  }
}
