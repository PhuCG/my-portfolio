import 'package:flutter/material.dart';

/// Static color and gradient constants for Vaporwave design system.
///
/// Theme-aware colors (per-mode) live in [VaporwaveColors] ThemeExtension.
/// These constants are only for elements that cannot be theme-aware:
///   - Gradient shaders (ShaderMask, CustomPainter)
///   - Static const decorations outside of BuildContext
class AppColors {
  AppColors._();

  // ─── Brand Neon (used in gradients — always full-saturation) ──────────────
  static const Color hotMagenta = Color(0xFFFF00FF);
  static const Color electricCyan = Color(0xFF00FFFF);
  static const Color sunsetOrange = Color(0xFFFF9900);

  // ─── Gradients ─────────────────────────────────────────────────────────────

  /// Signature Vaporwave: orange → magenta → cyan (used for text fills, hero).
  static const LinearGradient sunsetGradient = LinearGradient(
    colors: [sunsetOrange, hotMagenta, electricCyan],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  /// Top accent bar / divider: magenta → cyan.
  static const LinearGradient accentBarGradient = LinearGradient(
    colors: [hotMagenta, electricCyan],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  /// Floating sun orb background (top to bottom).
  static const LinearGradient floatingSunGradient = LinearGradient(
    colors: [sunsetOrange, hotMagenta],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  /// Duotone overlay on project images (blend mode overlay).
  static const LinearGradient duotoneOverlay = LinearGradient(
    colors: [
      Color(0x33FF00FF), // 20% magenta
      Color(0x3300FFFF), // 20% cyan
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
