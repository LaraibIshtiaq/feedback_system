import 'package:flutter/material.dart';

Offset getWidgetCenterOffsetInfo(GlobalKey widgetKey) {
  final RenderBox renderBox =
      widgetKey.currentContext?.findRenderObject() as RenderBox;

  final Offset offset = renderBox.localToGlobal(Offset.zero);

  return Offset((offset.dx), (offset.dy));
}
