import 'package:capp_mobile/domain/model/ui_dto/project.dart';
import 'package:capp_mobile/shared/theme/app_dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget primaryDropdown({
  required BuildContext context,
  required String projectTitle,
  required String projectLogo,
  required bool showDropdown,
  VoidCallback? onPressedDropdown,
  required List<Project> projectList
}){
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
        DropdownButton<Project>(
          underline: Container(),
          isExpanded: true,
          value: projectList.first,
          items: projectList.map((Project value) {
            return DropdownMenuItem<Project>(
              value: value,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(value.projectLogo,
                      width: dimensions.iconSizePrimary,
                      height: dimensions.iconSizePrimary),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: dimensions.spacingNormal),
                    child: Text(value.projectName, style: Theme.of(context).textTheme.bodyMedium),
                  )
                ],
              ),
            );
          }).toList(),
          onChanged: (_) {},
        ),
      ),
    ),
  );
}