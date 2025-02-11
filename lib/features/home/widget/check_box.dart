import 'package:capp_mobile/domain/model/enums/categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EventCheckBox extends ConsumerWidget {
  /// The callback function to be invoked when the checkbox state is changed.
  final Function onChange;

  /// The provider for managing the state of the checkbox.
  final StateProvider<bool>? checkBoxValueProvider;

  /// The placeholder for the checkbox. Its a required field
  final String checkBoxText;

  late bool checkboxState;

  ///Category number to assing color to that specific category
  int categoryNumber;

  /// Creates a TMRCheckbox with the given properties.
  EventCheckBox(
      {super.key,
        required this.onChange,
        this.checkBoxValueProvider,
        required this.checkBoxText,
        required this.categoryNumber,
        required this.checkboxState});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () => onTapOfCheckBox(ref, checkboxState),
      child: Row(
        children: [
          Checkbox(
            fillColor: WidgetStateProperty.all(
                Categories.values[categoryNumber].colorValue
            ),
              ///TODO: Just change check color to colorWhite,
              /// so it will get back to checkboxes
              checkColor: Categories.values[categoryNumber].colorValue,
              value: checkboxState,
              onChanged: (newValue){}),

          Text(checkBoxText),
        ],
      ),
    );
  }

  onTapOfCheckBox(WidgetRef ref, bool checkboxState) {}
}