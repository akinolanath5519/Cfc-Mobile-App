import 'package:cfc/widgets/size_utility.dart';
import 'package:flutter/material.dart';


String _appTheme = "primary";
PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

/// Helper class for managing themes and colors.
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class ThemeHelper {
  // A map of custom color themes supported by the app
  Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

// A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Changes the app theme to [_newTheme].
  void changeTheme(String _newTheme) {
    _appTheme = _newTheme;
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: colorScheme.primary,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyMedium: TextStyle(
          color: colorScheme.primaryContainer,
          fontSize: 14.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        labelLarge: TextStyle(
          color: appTheme.black90001,
          fontSize: 12.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        ),
        bodySmall: TextStyle(
          color: appTheme.indigo100,
          fontSize: 12.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        headlineSmall: TextStyle(
          color: colorScheme.onSecondaryContainer,
          fontSize: 24.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w800,
        ),
        titleMedium: TextStyle(
          color: colorScheme.errorContainer,
          fontSize: 16.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        titleSmall: TextStyle(
          color: appTheme.indigo100,
          fontSize: 14.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w600,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final primaryColorScheme = ColorScheme.light(
    primary: Color(0XFF20007F),
    primaryContainer: Color(0XFF474A56),
    secondaryContainer: Color(0XFFF8F8FA),
    errorContainer: Color(0XFFFFFFFF),
    onPrimary: Color(0XFFFF5959),
    onPrimaryContainer: Color(0XFF0B0B0B),
    onSecondaryContainer: Color(0XFFE01B28),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  Color get black900 => Color(0XFF010101);
  Color get black90001 => Color(0XFF000000);
// Blue
  Color get blue100 => Color(0XFFCED9F9);
// BlueGray
  Color get blueGray400 => Color(0XFF888888);
  Color get blueGray800 => Color(0XFF474A56);
// Gray
  Color get gray200 => Color(0XFFE7E7E7);
  Color get gray50 => Color(0XFFF8F8FA);
  Color get gray700 => Color(0XFF545454);
// Indigo
  Color get indigo100 => Color(0XFFC8D1E1);
  Color get indigo50 => Color(0XFFE7ECFC);
// Yellow
  Color get yellow700 => Color(0XFFFBB732);
  Color get black90002 => Color(0XFF000000);
// Blue
  Color get blue800 => Color(0XFF1849D6);
  Color get blue600 => Color(0XFF3281EC);
  Color get blueA700 => Color(0XFF005FF9);

// Gray

  Color get gray5001 => Color(0XFFF9F5FE);
  Color get gray600 => Color(0XFF6D6D6D);
// Indigof
  Color get indigo1003f => Color(0X3FC8D1E1);
// Indigo
  Color get indigo900 => Color(0XFF20007F);
// Red
  Color get red700 => Color(0XFFE01B28);
// White
  Color get whiteA700 => Color(0XFFFFFFFF);
// Yellow
// Gray
  Color get gray100 => Color(0XFFF3F3F3);
// Indigo

  Color get amberA700 => Color(0XFFF7A700);

// Blue
// BlueGray
  Color get blueGray100 => Color(0XFFCECECE);
  Color get blueGray10001 => Color(0XFFD9D9D9);
// DeepOrangec
  Color get deepOrange7000c => Color(0X0CF13E17);
// Gray
  Color get gray10001 => Color(0XFFF5F6FA);
  Color get gray300 => Color(0XFFDEE1EF);
  Color get gray800 => Color(0XFF3A3A3A);
// Green
  Color get greenA700 => Color(0XFF20C968);
// Indigo
  Color get indigoA400 => Color(0XFF3D56FA);
  Color get indigoA700 => Color(0XFF2743FD);
  Color get indigoA70001 => Color(0XFF2B47FC);
  // Amber
  Color get amber700 => Color(0XFFFFA200);

// Blackf
  Color get black9003f => Color(0X3F000000);

// Cyan
  Color get cyanA400 => Color(0XFF14E2ED);
// Gray

  Color get indigo500 => Color(0XFF4060B2);
// Red
  Color get red100 => Color(0XFFFFD4D4);
  Color get redA200 => Color(0XFFFF5959);

// Gray
  Color get gray90060 => Color(0X60121212);
// BlueGray
  Color get blueGray300 => Color(0XFF9DA8B6);
  Color get blueGray900 => Color(0XFF30324B);

  Color get gray900 => Color(0XFF1D1E2C);
// Indigo
  Color get indigo10001 => Color(0XFFC8D1E1);
// Red
// Teal
  Color get teal800 => Color(0XFF006156);
// White
}
