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
  final double spacingSmaller; //8
  final double spacingSmall; //10
  final double spacingNormal; //14
  final double spacingMedium; //16
  final double spacingLarge;
  final double spacingMediumLarge;
  final double spacingExtraLarge;
  final double spacingLayoutNormal;
  final double spacingLayoutMedium;
  final double spacingLayoutBottom;
  final double spacingLayoutTop;
  final double floatingButtonSize;//60
  final double iconSizePrimary;//24
  final double iconSizeSecondary;//16
  final double buttonHeightPrimary;
  final double buttonHeightSecondary;
  final double feedbackButtonHeight;
  final double textFieldHeightPrimary;
  final double textFieldHeightSecondary;
  final double textFieldSpacingSmall;
  final double textFieldSpacingMedium;
  final double textFieldSpacingLarge;
  final double dropdownHeightPrimary;//60
  final double cornerRadiusPrimary;//16//Used in dialogs
  final double cornerRadiusSecondary;//8//Used in dropdown
  final double cornerRadiusTertiary;//4//Used in calendar buttons
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
  final double borderSidePrimary;
  final double borderSideSecondary;
  final double itemHeightPrimary;

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
    this.floatingButtonSize = 60,
    this.iconSizePrimary = 24,
    this.iconSizeSecondary = 16,
    required this.buttonHeightPrimary,
    required this.buttonHeightSecondary,
    required this.feedbackButtonHeight,
    required this.textFieldHeightPrimary,
    required this.textFieldHeightSecondary,
    required this.textFieldSpacingSmall,
    required this.textFieldSpacingMedium,
    required this.textFieldSpacingLarge,
    this.dropdownHeightPrimary = 60,
    required this.cornerRadiusPrimary,
    required this.cornerRadiusSecondary,
    this.cornerRadiusTertiary = 4,
    required this.cornerRadiusDialog,
    required this.strokeWidthPrimary,
    required this.strokeWidthSecondary,
    required this.dividerPrimary,
    required this.dividerSecondary,
    required this.checkboxSize,
    required this.appLogoLarge,
    required this.appLogoNormal,
    required this.appLogoSmall,
    required this.elevation,
    this.borderSidePrimary = 1,
    this.borderSideSecondary = 4, //used in event list item
    this.itemHeightPrimary = 80,
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
  spacingExtraLarge: 44.0,
  spacingLayoutNormal: 24.0,
  spacingLayoutMedium: 32.0,
  spacingLayoutBottom: 60.0,
  spacingLayoutTop: 56.0,
  buttonHeightPrimary: 56.0,
  buttonHeightSecondary: 48.0,
  feedbackButtonHeight: 90.0,
  textFieldHeightPrimary: 60.0,
  textFieldHeightSecondary: 90.0,
  textFieldSpacingSmall: 2.0,
  textFieldSpacingMedium: 8.0,
  textFieldSpacingLarge: 12.0,
  cornerRadiusPrimary: 16.0,
  cornerRadiusSecondary: 8.0,
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
  spacingLayoutBottom: 36.0,
  spacingLayoutTop: 32.0,
  buttonHeightPrimary: 52.0,
  buttonHeightSecondary: 40.0,
  feedbackButtonHeight: 90.0,
  textFieldHeightPrimary: 50.0,
  textFieldHeightSecondary: 78.0,
  textFieldSpacingSmall: 2.0,
  textFieldSpacingMedium: 8.0,
  textFieldSpacingLarge: 12.0,
  cornerRadiusPrimary: 16.0,
  cornerRadiusSecondary: 8.0,
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