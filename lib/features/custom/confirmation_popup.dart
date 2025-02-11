import 'package:capp_mobile/features/custom/primary_button.dart';
import 'package:capp_mobile/features/custom/secondary_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ConfirmationPopup extends StatelessWidget {
  String dialogTitle;
  String dialogSubTitle;
  String confirmationText;
  VoidCallback onPressedCancel;
  VoidCallback onPressedOk;

  /// Creates a CAPP Confirmation Popup with the given parameters.
  ConfirmationPopup({
    super.key,
    required this.dialogTitle,
    required this.dialogSubTitle,
    required this.confirmationText,
    required this.onPressedCancel,
    required this.onPressedOk
});

  @override
  Widget build(BuildContext context) {
    // set up the buttons
    Widget cancelButton = Expanded(
      flex: 2,
      child: SecondaryButton(
        onPressed: onPressedCancel,
        buttonText: tr("cancel"),
        padding: 0,
      ),
    );
    Widget continueButton = Expanded(
      flex: 3,
      child: PrimaryButton(
        buttonText: confirmationText,
        onPressed: onPressedOk,
        padding: 0,
      ),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(dialogTitle, style: Theme.of(context).textTheme.titleMedium),
      content: Text(dialogSubTitle, style: Theme.of(context).textTheme.labelMedium,),
      actions: [
        Row(
          children: [
            cancelButton,
            SizedBox(width: 2),
            continueButton
          ],
        )
      ],
    );
    return alert;
  }
}
