import 'package:capp_mobile/domain/model/enums/categories.dart';
import 'package:flutter/material.dart';

class EventCategory{
  int categoryId;
  String categoryName;
  Color categoryColor;

  EventCategory({
    required this.categoryId,
    required this.categoryName,
    required this.categoryColor
  });


  ///Temp method for getting whole EventCategory
  ///object from category received from server
  factory EventCategory.fromString(String category){
    var categoryValue = (category == "PK Holiday")
        ? Categories.pk : (category == "DK Holiday")
        ? Categories.dk : (category == "Release")
        ? Categories.releases : (category == "Leave")
        ? Categories.leaves : Categories.others;

    return EventCategory(
      categoryId: categoryValue.intValue,
        categoryName: categoryValue.stringValue,
        categoryColor: categoryValue.colorValue
    );
  }


  ///Method to generate [EventCategory] object from json
  // factory EventCategory.fromJson(Map<String, dynamic> json) {
  //   return EventCategory(
  //     categoryName: categoryValue.stringValue,
  //     categoryColor: categoryValue.colorValue,
  //   );
  // }

  ///Method to transform [EventCategory] object to json
  Map<String, dynamic> toJson() {
    return {
      // 'id': categoryId,
      'title': categoryName,
      // 'color' : categoryColor
    };
  }
}