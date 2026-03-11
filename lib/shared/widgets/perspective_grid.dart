import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:portfolio/core/design_system/app_color_scheme.dart';

/// Receding perspective grid floor — the iconic Vaporwave / Outrun background.
/// Lines converge to a central vanishing point at the top of the widget.
class PerspectiveGrid extends StatelessWidget {
  const PerspectiveGrid({super.key, this.height = 400});

  final double height;

  @override
  Widget build(BuildContext context) {
    final vc = context.vaporColors;
    return SizedBox(
      height: height,
      child: RepaintBoundary(
        child: ShaderMask(
          // Fade the grid to transparent at the top (horizon)
          shaderCallback: (rect) => const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, Colors.black],
            stops: [0.0, 0.6],
          ).createShader(rect),
          blendMode: BlendMode.dstIn,
          child: CustomPaint(
            painter: _GridPainter(lineColor: vc.gridLineColor),
            size: Size.infinite,
          ),
        ),
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  const _GridPainter({required this.lineColor});

  final Color lineColor;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..strokeWidth = 1;
    final vanishingX = size.width / 2;
    const numVertical = 14;
    const numHorizontal = 12;

    // Horizontal lines — spaced with perspective (closer at bottom)
    for (int i = 1; i <= numHorizontal; i++) {
      final t = math.pow(i / numHorizontal, 2).toDouble();
      final y = t * size.height;
      paint.color = lineColor.withValues(alpha: 0.15 + 0.35 * t);
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }

    // Vertical lines — converging to vanishing point
    for (int i = 0; i <= numVertical; i++) {
      final t = i / numVertical;
      final startX = t * size.width;
      paint.color = lineColor.withValues(alpha: 0.25);
      canvas.drawLine(
        Offset(startX, size.height),
        Offset(vanishingX, 0),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(_GridPainter old) => old.lineColor != lineColor;
}
