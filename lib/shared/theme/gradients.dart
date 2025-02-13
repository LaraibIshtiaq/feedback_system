import 'package:capp_mobile/shared/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

LinearGradient primaryGradient = LinearGradient(
  colors: [
    colorBlueGradientFirst,
    colorBlueGradientSecond,
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);


class TriangleGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
        colors: [
          colorWhiteGradientFirst, // Top-left gradient color
          colorWhiteGradientFirst.withOpacity(0.1), // Fade to transparent
          colorWhite, // Bottom-right gradient color
        ],
        stops: [0.0, 0.3, 1.0],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    Path path = Path()
      ..moveTo(size.width, 0) // Top-right corner
      ..lineTo(size.width * 0.5, 0) // Move left
      ..lineTo(size.width, size.height * 0.5) // Move down
      ..close();

    Path path2 = Path()
      ..moveTo(0, size.height) // Bottom-left corner
      ..lineTo(size.width * 0.5, size.height) // Move right
      ..lineTo(0, size.height * 0.5) // Move up
      ..close();

    canvas.drawPath(path, paint);
    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}