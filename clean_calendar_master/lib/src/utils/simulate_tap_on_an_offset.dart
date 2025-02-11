import 'package:flutter/gestures.dart';

void simulateTapOnAnOffset(Offset offset) {
  GestureBinding.instance.handlePointerEvent(PointerDownEvent(
    position: offset,
  ));

  GestureBinding.instance.handlePointerEvent(PointerUpEvent(
    position: offset,
  ));
}
