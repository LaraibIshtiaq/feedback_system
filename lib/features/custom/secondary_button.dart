import 'package:capp_mobile/shared/theme/app_dimens.dart';
import 'package:flutter/material.dart';

/// The SecondaryButton button widget for CAPP app.
///
/// This button widget displays a text label inside an elevated button
/// with customizable properties.
class SecondaryButton extends StatelessWidget {
  /// The desired size of the button.
  final Size? size;

  /// The background color of the button.
  final Color? backgroundColor;

  /// The text to be displayed on the button.
  final String buttonText;

  /// The callback function to be invoked when the button is pressed.
  final VoidCallback onPressed;

  /// The callback function to be invoked when the button is not enabled but pressed.
  final VoidCallback? onDisabledPressed;

  /// A boolean to ensure the button is enabled or not
  final bool enable;

  /// Elevation of button if needed
  final double? elevation;

  ///Padding if you want to customize
  final double? padding;

  /// Creates a CAPP SecondaryButton Button with the given parameters.
  const SecondaryButton({
    super.key,
    this.size,
    this.backgroundColor,
    required this.buttonText,
    required this.onPressed,
    this.enable = true,
    this.elevation,
    this.onDisabledPressed,
  this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: dimensions.buttonHeightPrimary,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(dimensions.cornerRadiusSecondary),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    dimensions.cornerRadiusSecondary),
                side: BorderSide(
                    color: Theme.of(context).primaryColor)),
          ),
          onPressed: enable ? onPressed : onDisabledPressed,
          child: Padding(
            padding: EdgeInsets.all(padding ?? dimensions.spacingMedium),
            child: Text(buttonText,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displaySmall
                    ?.copyWith(color: Theme.of(context).primaryColor)),
          ),
        )
    );
  }
}
