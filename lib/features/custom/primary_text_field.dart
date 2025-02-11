import 'package:capp_mobile/shared/theme/app_colors.dart';
import 'package:capp_mobile/shared/theme/app_dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A custom text field widget for TinyMobileRobot (TMR) app.
///
/// This widget displays a text input field with optional customization options,
/// such as input type, text alignment, and hint text.
class PrimaryTextField extends ConsumerStatefulWidget {
  /// The controller for the text field.
  final TextEditingController textEditingController;

  /// The type of text input to be expected.
  final TextInputType? textInputType;

  /// The hint text to be displayed when the text field is empty. If not provided, no text will be shown as hint.
  final String? hintText;

  ///The Suffix icon
  final Widget? suffix;

  ///hasTrailingIcon will be used to determine
  ///whether the field has any trailing icons or not
  final bool? hasTrailingIcon;

  /// The maxLine indicates the maximum lines  with in text field
  final int? maxLine;

  /// The isTextFieldEnabled indicates the behaviour of text field for input.
  final bool? isTextFieldEnabled;

  final RegExp? regExp;

  final Function(String)? onChanged;

  final Function(String)? onFieldSubmit;

  final bool isRequired;

  final Function(PointerDownEvent)? onTapOutsideEvent;

  final TextInputAction textInputAction;

  /// Creates a PrimaryTextField widget with the given [textEditingController],
  /// [textInputType], [textAlign], and [hintText].
  const PrimaryTextField(
      {super.key,
        required this.textEditingController,
        this.textInputAction = TextInputAction.done,
        this.onFieldSubmit,
        this.textInputType = TextInputType.text,
        this.hintText,
        this.suffix,
        this.hasTrailingIcon = false,
        this.maxLine = 1,
        this.isTextFieldEnabled,
        this.regExp,
        this.onChanged,
        this.onTapOutsideEvent,
      this.isRequired = false});

  @override
  ConsumerState<PrimaryTextField> createState() => _PrimaryTextFieldState();
}

class _PrimaryTextFieldState extends ConsumerState<PrimaryTextField> {
  late VoidCallback listener;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void validateField() {
    setState(() {
      if (widget.isRequired && widget.textEditingController.text.trim().isEmpty) {
        errorMessage = "This field is required";
      } else {
        errorMessage = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: dimensions.spacingSmall),
      child: TextFormField(
        expands: false,
        maxLines: widget.maxLine == 1? null : widget.maxLine,
        minLines: widget.maxLine == 1? null : widget.maxLine,
        onTap: (){},
        onTapOutside: (event){
          if(widget.onTapOutsideEvent!=null){
            widget.onTapOutsideEvent!(event);
          }
          validateField();
          FocusScope.of(context).unfocus();
        },
        onChanged: widget.onChanged,
        enabled: widget.isTextFieldEnabled ?? true,
        cursorColor: Theme.of(context).primaryColor,
        controller: widget.textEditingController,
        keyboardType: widget.maxLine == 1? widget.textInputType : TextInputType.multiline,
        textInputAction: widget.textInputAction,
        onFieldSubmitted:(value){
          if(widget.onFieldSubmit!=null){
            widget.onFieldSubmit!(value);
          }
          validateField();
        },
        inputFormatters: [/*LengthLimitingTextInputFormatter(50)*/],
        textAlign: TextAlign.start,
        style: Theme.of(context).textTheme.labelMedium,
        decoration: InputDecoration(
          label: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: widget.hintText.toString(),
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                if(widget.isRequired)TextSpan(
                  text: " *",
                  style: Theme.of(context).textTheme.labelSmall!
                    .copyWith(color: Colors.red),
                ),
              ],
            ),
          ),
          contentPadding: EdgeInsets.symmetric(
              horizontal: dimensions.spacingMedium,
          vertical: dimensions.spacingSmall),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(8)),
            borderSide: BorderSide(
              color: Theme.of(context).focusColor, // Unfocused border color
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(8)),
            borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 1.5
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(8)),
            borderSide: BorderSide(
                color: colorRed,
                width: 1.5
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(8)),
            borderSide: BorderSide(
                color: colorRed,
                width: 1.5
            ),
          ),
          filled: true,
          fillColor: Theme.of(context).focusColor,
          errorText: errorMessage,
        ),
      )
    );
  }
}