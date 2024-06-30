import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:ultimate_solutions_task/core/resources/shared_preferences_keys.dart';
import 'package:ultimate_solutions_task/domain/entities/login/user.dart';

class GetUserIdUseCase {
  final SharedPreferences _sharedPreferences;

  GetUserIdUseCase(this._sharedPreferences);

  String call() {
    return _sharedPreferences.getString(SharedPreferenceKeys.user) ?? "1010";
  }
}
