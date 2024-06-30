import 'package:flutter/material.dart';
import 'package:ultimate_solutions_task/config/theme/color_manager.dart';

class AppTheme {
  String language;

  AppTheme(this.language);

  ThemeData get light {
    return ThemeData(
      useMaterial3: false,
      fontFamily: getFontFamily(),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(8),
        hintStyle: TextStyle(
            fontSize: 14,
            fontFamily: getFontFamily(),
            // color: ColorManager.gray,
            letterSpacing: 0.26,
            fontWeight: FontWeight.normal),
        labelStyle: TextStyle(
            fontSize: 14,
            fontFamily: getFontFamily(), //todo handle font family
            // color: ColorManager.gray,
            fontWeight: FontWeight.normal),
        errorStyle: TextStyle(
            fontSize: 12,
            fontFamily: getFontFamily(), //todo handle font family
            // color: ColorManager.redError,
            fontWeight: FontWeight.normal),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            // color: ColorManager.gray,
            width: 1,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            // color: ColorManager.gray,
            width: 1,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            // color: ColorManager.redError,
            width: 1,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            // color: ColorManager.redError,
            width: 1,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        alignLabelWithHint: true,
      ),
      textTheme: TextTheme(
        titleLarge: getTextStyle(
            fontSize: 18,
            fontFamily: getFontFamily(),
            fontWeight: FontWeight.w600,
            color: ColorManager.primary),
        bodyLarge: getTextStyle(
          fontSize: 16,
          fontFamily: getFontFamily(),
          fontWeight: FontWeight.w600,
          color: ColorManager.primary,
        ),
        bodyMedium: getTextStyle(
          fontSize: 13,
          fontFamily: getFontFamily(),
          fontWeight: FontWeight.w500,
          color: ColorManager.primary,
        ),
        bodySmall: getTextStyle(
          fontSize: 13,
          fontFamily: getFontFamily(),
          fontWeight: FontWeight.normal,
          textDecoration: TextDecoration.none,
          color: ColorManager.primary,
        ),
        labelLarge: getTextStyle(
          fontSize: 12,
          fontFamily: getFontFamily(),
          fontWeight: FontWeight.normal,
          color: ColorManager.primary,
        ), //Regular
      ),
      scaffoldBackgroundColor: Colors.white,
      primaryColor: ColorManager.primary,
      splashColor: Colors.transparent,
    );
  }

  String getFontFamily() => language == "en"
      ? "Montserrat"
      : "Montserrat"; //todo handle font family for arabic

  static TextStyle getTextStyle({
    double fontSize = 24,
    FontWeight fontWeight = FontWeight.normal,
    String fontFamily = "Montserrat",
    required Color color,
    textDecoration = TextDecoration.none,
  }) {
    return TextStyle(
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
        decoration: textDecoration);
  }
}
