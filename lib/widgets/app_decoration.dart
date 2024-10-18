import 'package:cfc/widgets/size_utility.dart';
import 'package:cfc/widgets/theme.dart';
import 'package:flutter/material.dart';


class AppDecoration {
  // Background decorations
  static BoxDecoration get background => BoxDecoration(
        color: theme.colorScheme.primary,
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [Color(0XFFED0006), Color(0XFF20007F)]),
      );
  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.whiteA700,
      );
// Outline decorations
  static BoxDecoration get outlineBlack => BoxDecoration(
        color: appTheme.whiteA700,
        boxShadow: [
          BoxShadow(
            color: appTheme.black90001.withOpacity(0.04),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              4,
            ),
          )
        ],
      );
  static BoxDecoration get outlineIndigo => BoxDecoration(
        color: appTheme.indigo10001.withOpacity(0.25),
        border: Border.all(
          color: appTheme.indigo10001,
          width: 1.h,
        ),
      );
// Fill decorations
  static BoxDecoration get fillErrorContainer => BoxDecoration(
        color: theme.colorScheme.errorContainer,
      );
  static BoxDecoration get fillIndigo => BoxDecoration(
        color: appTheme.indigo50,
      );
  static BoxDecoration get fillYellow => BoxDecoration(
        color: appTheme.yellow700,
      );
  static BoxDecoration get buttons => BoxDecoration(
        color: appTheme.gray100,
        border: Border.all(
          color: appTheme.indigo100,
          width: 1.h,
        ),
      );

// Outline decorations
  static BoxDecoration get outlineBlack90001 => BoxDecoration(
        color: appTheme.whiteA700,
        border: Border.all(
          color: appTheme.black90001,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineIndigo100 => BoxDecoration(
        color: appTheme.blueGray10001.withOpacity(0.1),
        border: Border.all(
          color: appTheme.indigo100.withOpacity(0.15),
          width: 1.h,
        ),
      );

// Fill decorations
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray50,
      );
  static BoxDecoration get fillOnErrorContainer => BoxDecoration(
        color: theme.colorScheme.onErrorContainer,
      );
}

class BorderRadiusStyle {
  // Custom borders
  static BorderRadius get customBorderTL15 => BorderRadius.vertical(
        top: Radius.circular(15.h),
      );

  static BorderRadius get roundedBorder10 => BorderRadius.circular(
        10.h,
      );

// Rounded borders
  static BorderRadius get roundedBorder16 => BorderRadius.circular(
        16.h,
      );
  static BorderRadius get roundedBorder14 => BorderRadius.circular(
        14.h,
      );
  static BorderRadius get roundedBorder5 => BorderRadius.circular(
        5.h,
      );
  static BorderRadius get roundedBorder8 => BorderRadius.circular(
        8.h,
      );
  static BorderRadius get circleBorder40 => BorderRadius.circular(
        40.h,
      );
// Custom borders
  static BorderRadius get customBorderBL12 => BorderRadius.vertical(
        bottom: Radius.circular(12.h),
      );
// Rounded borders
  static BorderRadius get roundedBorder12 => BorderRadius.circular(
        12.h,
      );
  static BorderRadius get roundedBorder6 => BorderRadius.circular(
        6.h,
      );
}
