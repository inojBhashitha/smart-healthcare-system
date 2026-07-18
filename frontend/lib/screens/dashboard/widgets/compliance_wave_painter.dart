import 'package:flutter/material.dart';

class ComplianceWavePainter extends CustomPainter {
  const ComplianceWavePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;

    // Stroke Paint (Main Line Gradient)
    final strokePaint = Paint()
      ..strokeWidth = 3.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..shader = const LinearGradient(
        colors: [Color(0xFF2563EB), Color(0xFF06B6D4)],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ).createShader(Rect.fromLTWH(0, 0, width, height));

    // Fill Paint (Gradient area under the curve)
    final fillPaint = Paint()
      ..style = PaintingStyle.fill
      ..shader = LinearGradient(
        colors: [
          const Color(0xFF2563EB).withValues(alpha: 0.25),
          const Color(0xFF06B6D4).withValues(alpha: 0.0),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, width, height));

    final path = Path();
    path.moveTo(0, height * 0.85);

    // Smooth wave path using cubic bezier curves
    path.cubicTo(
      width * 0.25, height * 0.55,
      width * 0.45, height * 0.70,
      width * 0.65, height * 0.35,
    );

    path.cubicTo(
      width * 0.85, height * 0.10,
      width * 0.95, height * 0.90,
      width, height * 0.70,
    );

    // Draw Fill first
    final fillPath = Path.from(path);
    fillPath.lineTo(width, height);
    fillPath.lineTo(0, height);
    fillPath.close();
    canvas.drawPath(fillPath, fillPaint);

    // Draw Stroke Line
    canvas.drawPath(path, strokePaint);

    // Highlighted glowing dots on the line
    final dotPaint1 = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xFF06B6D4);

    final dotPaint2 = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xFF10B981); // Green dot

    final dotStrokePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..color = Colors.white;

    // Define calculated point offsets
    final List<Offset> points = [
      Offset(width * 0.25, height * 0.61),
      Offset(width * 0.65, height * 0.43),
      Offset(width, height * 0.70),
    ];

    for (int i = 0; i < points.length; i++) {
      final p = points[i];
      // Draw outer glowing halo
      canvas.drawCircle(
        p,
        6.0,
        Paint()..color = (i == 1 ? const Color(0xFF10B981) : const Color(0xFF06B6D4)).withValues(alpha: 0.3),
      );
      // Draw core dot
      canvas.drawCircle(p, 4.0, i == 1 ? dotPaint2 : dotPaint1);
      // Draw white stroke ring
      canvas.drawCircle(p, 4.0, dotStrokePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
