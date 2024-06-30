import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:ultimate_solutions_task/core/resources/shared_preferences_keys.dart';
import 'package:ultimate_solutions_task/domain/entities/login/user.dart';

class SaveUserUseCase {
  final SharedPreferences _sharedPreferences;

  SaveUserUseCase(this._sharedPreferences);

  Future<bool> call(User user) async {
    return await (_sharedPreferences.setString(SharedPreferenceKeys.user, jsonEncode(user.toMap())));
  }
}