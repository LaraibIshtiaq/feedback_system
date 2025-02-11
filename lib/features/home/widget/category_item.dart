import 'package:capp_mobile/domain/model/enums/categories.dart';
import 'package:capp_mobile/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

Widget categoryItem(
    Categories category,
    BuildContext context,
    bool isSelected,
    VoidCallback onTap,
    ){
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(
          horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: category.backgroundColorValue,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isSelected ? category.colorValue
              : category.backgroundColorValue,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              radius: 8,
              backgroundColor: category.colorValue,
              child: CircleAvatar(
                radius: 3,
                backgroundColor: colorWhite,
              ),
            ),
          ),
          Text(category.stringValue,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: colorTextPrimaryLight
            ),
          ),
        ],
      ),
    ),
  );
}