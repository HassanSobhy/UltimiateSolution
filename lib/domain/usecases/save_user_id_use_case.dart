import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:ultimate_solutions_task/core/resources/shared_preferences_keys.dart';
import 'package:ultimate_solutions_task/domain/entities/login/user.dart';

class SaveUserIdUseCase {
  final SharedPreferences _sharedPreferences;

  SaveUserIdUseCase(this._sharedPreferences);

  Future<bool> call(String userId) async {
    return await (_sharedPreferences.setString(
        SharedPreferenceKeys.userId, userId));
  }
}
