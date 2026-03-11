import 'package:flutter/material.dart';
import 'package:portfolio/core/design_system/app_color_scheme.dart';

/// Full-screen fixed CRT scanline overlay.
/// Renders horizontal lines every 4px using a repeating gradient.
/// Applied at the very top of the Stack (above all content) with IgnorePointer.
class ScanlineOverlay extends StatelessWidget {
  const ScanlineOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    final vc = context.vaporColors;
    return Positioned.fill(
      child: IgnorePointer(
        child: RepaintBoundary(
          child: CustomPaint(
            painter: _ScanlinePainter(lineColor: vc.scanlineColor),
          ),
        ),
      ),
    );
  }
}

class _ScanlinePainter extends CustomPainter {
  const _ScanlinePainter({required this.lineColor});

  final Color lineColor;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = lineColor
      ..strokeWidth = 1;

    for (double y = 0; y < size.height; y += 4) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(_ScanlinePainter old) => old.lineColor != lineColor;
}
