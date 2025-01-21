import 'package:capp_mobile/shared/theme/app_colors.dart';
import 'package:capp_mobile/shared/theme/app_dimens.dart';
import 'package:capp_mobile/shared/theme/text_styles.dart';
import 'package:flutter/material.dart';

/// A custom button widget for CAPP app.
///
/// This button widget displays a text label inside an elevated button
/// with customizable properties.
class PrimaryButton extends StatelessWidget {
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

  /// Creates a CAPP Primary Button with the given parameters.
  const PrimaryButton({
    super.key,
    this.size,
    this.backgroundColor,
    required this.buttonText,
    required this.onPressed,
    this.enable = true,
    this.elevation,
    this.onDisabledPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              colorBlueGradientFirst,
              colorBlueGradientSecond,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(dimensions.cornerRadiusPrimary),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: size,
            backgroundColor: enable
                ? backgroundColor ?? Theme.of(context).primaryColor
                : Theme.of(context).secondaryHeaderColor,
            elevation: elevation ?? dimensions.elevation,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    dimensions.cornerRadiusPrimary),
                side: BorderSide(
                    color: Theme.of(context).primaryColor)),
          ),
          onPressed: enable ? onPressed : onDisabledPressed,
          child: Padding(
            padding: EdgeInsets.all(dimensions.spacingMedium),
            child: Text(buttonText,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: enable
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).secondaryHeaderColor)),
          ),
        )
    );
  }
}
