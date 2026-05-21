import 'package:flutter/material.dart';
import 'dart:math';

class ArcMeter extends StatelessWidget {
  final double totalSpent;
  final double maxLimit;

  const ArcMeter({
    super.key,
    required this.totalSpent,
    required this.maxLimit,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(200, 100),
      painter: _ArcMeterPainter(
        total: totalSpent,
        limit: maxLimit,
      ),
    );
  }
}

class _ArcMeterPainter extends CustomPainter {
  final double total;
  final double limit;

  _ArcMeterPainter({
    required this.total,
    required this.limit,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height * 2);
    const startAngle = pi;
    
    final percentage = limit > 0 ? (total / limit).clamp(0.0, 1.0) : 0.0;
    final sweepAngle = pi * percentage;

    final bgPaint = Paint()
      ..color = Colors.grey.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(rect, startAngle, pi, false, bgPaint);

    final fgPaint = Paint()
      ..color = percentage > 0.9 ? Colors.red : Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(rect, startAngle, sweepAngle, false, fgPaint);
  }

  @override
  bool shouldRepaint(covariant _ArcMeterPainter oldDelegate) {
    return oldDelegate.total != total || oldDelegate.limit != limit;
  }
}
