import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:ultimate_solutions_task/core/resources/shared_preferences_keys.dart';
import 'package:ultimate_solutions_task/domain/entities/login/user.dart';

class GetUserUseCase {
  final SharedPreferences _sharedPreferences;

  GetUserUseCase(this._sharedPreferences);

  User call() {
    return _sharedPreferences.getString(SharedPreferenceKeys.user) != null
        ? User.fromMap(jsonDecode(
            _sharedPreferences.getString(SharedPreferenceKeys.user) ?? ""))
        : const User();
  }
}
