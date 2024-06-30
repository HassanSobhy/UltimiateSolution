extension LanguageCodeExtension on String {
  String getLanguageCode() {
    return this == "en" ? "2" : "1";
  }
}