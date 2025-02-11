import 'package:capp_mobile/shared/theme/app_colors.dart';
import 'package:capp_mobile/shared/theme/app_dimens.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget secondaryDropdown({
  required BuildContext context,
  required String projectTitle,
  required String projectLogo,
  required bool showDropdown,
  VoidCallback? onPressedDropdown,
  required List<String> values
}){
  String selectedValue = values.first;
  return Padding(
    padding: EdgeInsets.only(
        top: dimensions.spacingSmaller,
        left: dimensions.spacingMedium,
        right: dimensions.spacingMedium),
    child: Container(
      height: dimensions.dropdownHeightPrimary,
      decoration: BoxDecoration(
        color: Theme.of(context).focusColor,
        borderRadius: BorderRadius.circular(dimensions.cornerRadiusPrimary)
      ),
      child: Padding(
        padding: EdgeInsets.all(dimensions.spacingMedium),
        child:
        (!showDropdown) ?
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(projectLogo,
                width: dimensions.iconSizePrimary, height: dimensions.iconSizePrimary),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: dimensions.spacingNormal),
              child: Text(projectTitle, style: Theme.of(context).textTheme.headlineLarge),
            )
          ],
        )
        :
        DropdownButton<String>(
          underline: Container(),
          isExpanded: true,
          value: values.first,
          items: values.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: colorBlack,
                        radius: dimensions.iconSizeSecondary, // Adjust size
                        child: SvgPicture.asset(value),
                      ),
                      Positioned(
                        bottom: 1,
                        right: 1,
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: colorRed,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Colors.white,
                                width: 3),
                          ),
                          child: SvgPicture.asset(value),
                        ),
                      ),
                    ]
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: dimensions.spacingMedium),
                    child: Text(value,
                        style: Theme.of(context).textTheme.bodyMedium),
                  )
                ],
              ),
              onTap: (){
                  selectedValue = value;
              },
            );
          }).toList(),
          selectedItemBuilder: (context){
            return [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("${tr("by")}:",
                      style: Theme.of(context).textTheme.bodyMedium),

                  Stack(
                      children: [
                        CircleAvatar(
                          backgroundColor: colorBlack,
                          radius: dimensions.iconSizePrimary, // Adjust size
                          child: Image.asset(selectedValue),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 7,
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: colorRed,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 3),
                            ),
                            child: Image.asset(selectedValue),
                          ),
                        ),
                      ]
                  ),
                  Text("Laraib Ishtiaq",
                      style: Theme.of(context).textTheme.bodyMedium)
                ],
              )
             ];
          },
          onChanged: (_) {},
        ),
      ),
    ),
  );
}