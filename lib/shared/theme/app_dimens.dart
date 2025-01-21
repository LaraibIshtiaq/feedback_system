AppDimensions get dimensions => AppDimensions.currentDimensions;

class AppDimensions {

  static late AppDimensions currentDimensions;

  static void initialize(double screenWidth) {
    if (screenWidth < 420) {
      currentDimensions = smallDimensions;
    } else {
      currentDimensions = defaultDimensions;
    }
  }

  final double spacingSmallest;
  final double spacingSmaller;
  final double spacingSmall;
  final double spacingNormal;
  final double spacingMedium;
  final double spacingLarge;
  final double spacingMediumLarge;
  final double spacingExtraLarge;
  final double spacingLayoutNormal;
  final double spacingLayoutMedium;
  final double spacingLayoutBottom;
  final double spacingLayoutTop;
  final double spacingAddressIndicators;
  final double spacingPoweredByGoogle;
  final double buttonHeightPrimary;
  final double buttonHeightSecondary;
  final double textFieldHeightPrimary;
  final double textFieldHeightSecondary;
  final double textFieldSpacingSmall;
  final double textFieldSpacingMedium;
  final double textFieldSpacingLarge;
  final double cornerRadiusPrimary;
  final double cornerRadiusSecondary;
  final double cornerRadiusDialog;
  final double strokeWidthPrimary;
  final double strokeWidthSecondary;
  final double dividerPrimary;
  final double dividerSecondary;
  final double checkboxSize;
  final double appLogoLarge;
  final double appLogoNormal;
  final double appLogoSmall;
  final double elevation;

  const AppDimensions({
    required this.spacingSmallest,
    required this.spacingSmaller,
    required this.spacingSmall,
    required this.spacingNormal,
    required this.spacingMedium,
    required this.spacingLarge,
    required this.spacingMediumLarge,
    required this.spacingExtraLarge,
    required this.spacingLayoutNormal,
    required this.spacingLayoutMedium,
    required this.spacingLayoutBottom,
    required this.spacingLayoutTop,
    required this.spacingAddressIndicators,
    required this.spacingPoweredByGoogle,
    required this.buttonHeightPrimary,
    required this.buttonHeightSecondary,
    required this.textFieldHeightPrimary,
    required this.textFieldHeightSecondary,
    required this.textFieldSpacingSmall,
    required this.textFieldSpacingMedium,
    required this.textFieldSpacingLarge,
    required this.cornerRadiusPrimary,
    required this.cornerRadiusSecondary,
    required this.cornerRadiusDialog,
    required this.strokeWidthPrimary,
    required this.strokeWidthSecondary,
    required this.dividerPrimary,
    required this.dividerSecondary,
    required this.checkboxSize,
    required this.appLogoLarge,
    required this.appLogoNormal,
    required this.appLogoSmall,
    required this.elevation
  });
}

const defaultDimensions = AppDimensions(
  spacingSmallest: 6.0,
  spacingSmaller: 8.0,
  spacingSmall: 10.0,
  spacingNormal: 14.0,
  spacingMedium: 16.0,
  spacingLarge: 24.0,
  spacingMediumLarge: 32.0,
  spacingExtraLarge: 48.0,
  spacingLayoutNormal: 24.0,
  spacingLayoutMedium: 32.0,
  spacingLayoutBottom: 40.0,
  spacingLayoutTop: 56.0,
  spacingAddressIndicators: 4.0,
  spacingPoweredByGoogle: 62.0,
  buttonHeightPrimary: 56.0,
  buttonHeightSecondary: 48.0,
  textFieldHeightPrimary: 58.0,
  textFieldHeightSecondary: 64.0,
  textFieldSpacingSmall: 2.0,
  textFieldSpacingMedium: 8.0,
  textFieldSpacingLarge: 12.0,
  cornerRadiusPrimary: 8.0,
  cornerRadiusSecondary: 6.0,
  cornerRadiusDialog: 12.0,
  strokeWidthPrimary: 1.0,
  strokeWidthSecondary: 1.5,
  dividerPrimary: 1.0,
  dividerSecondary: 0.5,
  checkboxSize: 32.0,
  appLogoLarge: 152.0,
  appLogoNormal: 80.0,
  appLogoSmall: 40.0,
  elevation: 4.0,
);

const smallDimensions = AppDimensions(
  spacingSmallest: 4.0,
  spacingSmaller: 6.0,
  spacingSmall: 8.0,
  spacingNormal: 12.0,
  spacingMedium: 14.0,
  spacingLarge: 20.0,
  spacingMediumLarge: 28.0,
  spacingExtraLarge: 36.0,
  spacingLayoutNormal: 20.0,
  spacingLayoutMedium: 28.0,
  spacingLayoutBottom: 24.0,
  spacingLayoutTop: 32.0,
  spacingAddressIndicators: 3.0,
  spacingPoweredByGoogle: 60.0,
  buttonHeightPrimary: 52.0,
  buttonHeightSecondary: 40.0,
  textFieldHeightPrimary: 52.0,
  textFieldHeightSecondary: 58.0,
  textFieldSpacingSmall: 2.0,
  textFieldSpacingMedium: 8.0,
  textFieldSpacingLarge: 12.0,
  cornerRadiusPrimary: 8.0,
  cornerRadiusSecondary: 6.0,
  cornerRadiusDialog: 12.0,
  strokeWidthPrimary: 1.0,
  strokeWidthSecondary: 1.5,
  dividerPrimary: 1.0,
  dividerSecondary: 0.5,
  checkboxSize: 32.0,
  appLogoNormal: 72.0,
  appLogoSmall: 20.0,
  appLogoLarge: 120.0,
  elevation: 2.0
);