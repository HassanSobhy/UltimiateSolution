import 'package:shared_preferences/shared_preferences.dart';
import 'package:ultimate_solutions_task/core/resources/shared_preferences_keys.dart';

class SetLanguageUseCase {
  final SharedPreferences sharedPreferences;

  SetLanguageUseCase(this.sharedPreferences);

  Future<bool> call(String language) async {
    return await sharedPreferences.setString(
        SharedPreferenceKeys.language, language);
  }
}
