import 'package:flutter/material.dart';

class Dimensions {
  //Spaces
  static double space_2 = 2;
  static double space_5 = 5;
  static double space_10 = 10;
  static double space_15 = 15;
  static double space_20 = 20;
  static double space_30 = 30;
  static double space_50 = 50;

  //Radius
  static double radius_9= 9;
  static double radius_10= 10;
  static double radius_25= 25;
  static double radius_50= 50;
  static double radius_18 = 18;
  static double radius_15 = 15;
  static double radius_20 = 20;


  //custom font sizes
  static double textTiny = 12;
  static double textSmall = 14;
  static double textNormal = 16;
  static double textMediumLarge = 18;
  static double textLarge = 22;
  static double textExtraLarge = 55;



  static Widget verticalSpace(double height){
    return SizedBox(height: height,);
  }

  static Widget horizontalSpace(double width){
    return SizedBox(width: width,);
  }

}