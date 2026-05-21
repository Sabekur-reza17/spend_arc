import 'package:flutter/material.dart';

class LineChartPainter extends CustomPainter {
  final List<double> dataPoints;
  final Color lineColor;

  LineChartPainter({required this.dataPoints, required this.lineColor});

  @override
  void paint(Canvas canvas, Size size) {
    if (dataPoints.isEmpty) return;

    final maxVal = dataPoints.reduce((a, b) => a > b ? a : b);
    final minVal = 0.0;
    final range = maxVal - minVal > 0 ? maxVal - minVal : 1.0;

    final paint = Paint()
      ..color = lineColor
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final path = Path();
    final xStep = size.width / (dataPoints.length > 1 ? dataPoints.length - 1 : 1);

    for (int i = 0; i < dataPoints.length; i++) {
      final x = i * xStep;
      final y = size.height - ((dataPoints[i] - minVal) / range) * size.height;
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(path, paint);

    final fillPaint = Paint()
      ..shader = LinearGradient(
        colors: [lineColor.withOpacity(0.3), Colors.transparent],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;
      
    final fillPath = Path.from(path)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(fillPath, fillPaint);
  }

  @override
  bool shouldRepaint(covariant LineChartPainter oldDelegate) {
    if (oldDelegate.dataPoints.length != dataPoints.length) return true;
    for (int i = 0; i < dataPoints.length; i++) {
      if (oldDelegate.dataPoints[i] != dataPoints[i]) return true;
    }
    return oldDelegate.lineColor != lineColor;
  }
}
