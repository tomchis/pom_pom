import 'dart:math';

import 'package:flutter/material.dart';

class CountdownIndicator extends CustomPainter {
  CountdownIndicator({
    required this.percentComplete,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
  }) : assert(percentComplete >= 0.0 && percentComplete <= 1.0);

  /// Percentage between 0.0 and 1.0
  final double percentComplete;
  final Color activeColor;
  final Color inactiveColor;

  static const startAngle = (3 * pi) / 2; // 270 degrees (top of the circle)
  late final _inactivePaint =
      Paint()
        ..color = inactiveColor
        ..strokeWidth = 6.0
        ..style = PaintingStyle.stroke;
  late final _activePaint =
      Paint()
        ..color = activeColor
        ..strokeWidth = 10.0
        ..style = PaintingStyle.stroke;
  late final _strokePad = _activePaint.strokeWidth / 2;

  @override
  void paint(Canvas canvas, Size size) {
    final sweepAngle = (2 * pi) * percentComplete;

    final widthHeight = min(size.width, size.height) - (_strokePad * 2);
    final xPos = max((size.width - widthHeight) / 2, _strokePad);
    final yPos = max((size.height - widthHeight) / 2, _strokePad);

    final arcRect = Rect.fromLTRB(
      xPos,
      yPos,
      size.width - xPos,
      size.height - yPos,
    );

    canvas.drawArc(
      arcRect,
      startAngle + sweepAngle,
      (2 * pi) * (1 - percentComplete),
      false,
      _inactivePaint,
    );

    canvas.drawArc(arcRect, startAngle, sweepAngle, false, _activePaint);
  }

  @override
  bool shouldRepaint(covariant CountdownIndicator oldDelegate) =>
      percentComplete != oldDelegate.percentComplete;
}
