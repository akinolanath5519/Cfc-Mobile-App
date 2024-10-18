import 'package:cfc/widgets/size_utility.dart';
import 'package:cfc/widgets/theme.dart';
import 'package:flutter/material.dart';


extension on TextStyle {
  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }

  TextStyle get roboto {
    return copyWith(
      fontFamily: 'Roboto',
    );
  }

  TextStyle get dMSans {
    return copyWith(
      fontFamily: 'DM Sans',
    );
  }

  TextStyle get proximaNova {
    return copyWith(
      fontFamily: 'Proxima Nova',
    );
  }
}

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.
class CustomTextStyles {
  static get bodyMediumBlack90001 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black90001,
        fontWeight: FontWeight.w600,
        fontSize: 20.adaptSize,
      );
  // Label text style
  static get labelLargeSemiBold => theme.textTheme.labelLarge!.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get bodyMediumBluegray300 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray300,
      );
  static get bodyMediumBluegray800 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray800,
      );
  static get bodyMediumIndigo10001 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.indigo10001,
      );
  static get bodySmallGray900 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray900,
      );
  static get bodySmallGray900_1 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray900,
      );
  static get bodySmallIndigo10001 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.indigo10001,
      );
  static get bodySmallTeal800 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.teal800,
      );
// Title text style
  static get titleMediumBlue800 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blue800,
      );
  static get titleSmallRobotoBluegray800 =>
      theme.textTheme.titleSmall!.roboto.copyWith(
        color: appTheme.blueGray800,
        fontWeight: FontWeight.w900,
      );
  // Body text style
  static get bodyMediumBlack900 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black900,
        fontSize: 20.adaptSize,
      );
  static get bodyMediumWhiteA700 => theme.textTheme.bodyMedium!.copyWith(
      color: appTheme.whiteA700,
      fontSize: 12.adaptSize,
      fontWeight: FontWeight.w700);

  static get bodyMediumBlack90001_1 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black90001,
      );
  static get bodyMediumGray800 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray800,
      );
  static get bodyMediumIndigoA400 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.indigoA400,
      );

  static get bodySmallBlack90001 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.black90001.withOpacity(0.6),
      );
  static get bodySmallIndigoA700 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.indigoA700,
      );
  static get bodySmallPoppinsWhiteA700 =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: appTheme.whiteA700,
      );
  static get bodySmallRed700 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.red700.withOpacity(0.5),
      );
  static get bodySmallWhiteA700 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.whiteA700,
      );
// Label text style
  static get labelLargeBlack90001 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black90001.withOpacity(0.25),
      );
// Title text style
  static get titleMediumBlack90001 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black90001,
      );
  static get bodyMediumErrorContainer => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.errorContainer,
      );
  static get bodyMediumOnPrimary => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onPrimary,
      );
  static get bodyMediumOnPrimaryContainer =>
      theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static get bodyMediumOnPrimary_1 => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onPrimary,
      );
  static get bodyMediumPrimary => theme.textTheme.bodyMedium!.copyWith(
      color: theme.colorScheme.primary,
      fontWeight: FontWeight.w700,
      fontSize: 14.adaptSize);
  static get bodyMediumRobotoIndigo100 =>
      theme.textTheme.bodyMedium!.roboto.copyWith(
        color: appTheme.indigo100,
      );
// Title text style
  static get titleMediumOnPrimaryContainer =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontSize: 16.adaptSize,
      );
  static get titleMediumOnPrimaryContainer_1 =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );

  static get bodyMediumOnErrorContainer => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onErrorContainer,
        fontSize: 16.adaptSize,
      );

  static get bodySmallProximaNova => theme.textTheme.bodySmall!.proximaNova;
// Title style
  static get titleLargeProximaNova => theme.textTheme.titleLarge!.proximaNova;
  static get titleMediumInterOnPrimaryContainer =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumProximaNovaOnErrorContainer =>
      theme.textTheme.titleMedium!.proximaNova.copyWith(
        color: theme.colorScheme.onErrorContainer,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w700,
      );

  static get bodyMediumInterPrimaryContainer =>
      theme.textTheme.bodyMedium!.inter.copyWith(
        color: theme.colorScheme.primaryContainer,
      );

  static get bodySmallBlack90001_1 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.black90001,
      );
  static get bodySmallIndigo100 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.indigo100,
      );
  static get bodySmallPrimaryContainer => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.primaryContainer,
      );
// Title text style
  static get titleMediumDMSansPrimaryContainer =>
      theme.textTheme.titleMedium!.dMSans.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontWeight: FontWeight.w700,
      );

  static get bodyMediumInterBlue800 =>
      theme.textTheme.bodyMedium!.inter.copyWith(
        color: appTheme.blue800,
      );

  static get bodySmallBlack900 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w700,
        fontSize: 14.fSize,
      );
  static get bodySmallBlack90002 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.black90002,
        fontSize: 16.adaptSize,
      );

  static get bodySmallBlueA700 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.blueA700,
      );
  static get bodySmallGray90060 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray90060,
      );

  static get titleSmallSemiBold => theme.textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get titleSmallWhiteA700 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w600,
      );
// Title text style

  static get bodySmallBlue800 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.blue800,
      );
  static get bodySmallIndigo900 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.indigo900,
      );
  static get bodyMediumBlue600 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blue600,
      );
  static get bodyMediumBlueA700 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueA700,
      );
  static get bodySmallBlue600 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.blue600,
      );
// Title text style
  static get titleMediumInterWhiteA700 =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: appTheme.whiteA700,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w700,
      );
// Title text style
  static get titleMediumBlack90002 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black90002,
      );

  static get titleMediumDMSansBlue800 =>
      theme.textTheme.titleMedium!.dMSans.copyWith(
        color: appTheme.blue800,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumInter => theme.textTheme.titleMedium!.inter.copyWith(
        fontWeight: FontWeight.w700,
      );
}
