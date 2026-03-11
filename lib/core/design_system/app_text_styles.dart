import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_shadows.dart';

/// Vaporwave typography token system.
///
/// Styles are split into two layers:
///   1. **Structural** (`*Base` getters) — font family, size, weight, spacing only.
///      Use these when building ThemeData.textTheme.
///   2. **Semantic helpers** — combine structure + color + glow for direct use
///      in widgets (via BuildContext or explicit color param).
///
/// Fonts:
///   - Headings: Orbitron (geometric, futuristic, all-caps energy)
///   - Body/UI:  Share Tech Mono (terminal-like, monospace)
class AppTextStyles {
  AppTextStyles._();

  // ─── Structural (color-free) ───────────────────────────────────────────────

  static TextStyle get heroHeadlineBase => GoogleFonts.orbitron(
        fontSize: 96,
        fontWeight: FontWeight.w900,
        letterSpacing: -2,
        height: 1.05,
      );

  static TextStyle get heroHeadlineMobile => GoogleFonts.orbitron(
        fontSize: 48,
        fontWeight: FontWeight.w900,
        letterSpacing: -1,
        height: 1.1,
      );

  static TextStyle get sectionHeadingBase => GoogleFonts.orbitron(
        fontSize: 48,
        fontWeight: FontWeight.w700,
        letterSpacing: 2,
      );

  static TextStyle get sectionHeadingMobile => GoogleFonts.orbitron(
        fontSize: 30,
        fontWeight: FontWeight.w700,
        letterSpacing: 1,
      );

  static TextStyle get cardTitleBase => GoogleFonts.orbitron(
        fontSize: 24,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get bodyLargeBase => GoogleFonts.shareTechMono(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        height: 1.6,
      );

  static TextStyle get bodyMediumBase => GoogleFonts.shareTechMono(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.5,
      );

  static TextStyle get uiLabelBase => GoogleFonts.shareTechMono(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 2,
        textBaseline: TextBaseline.alphabetic,
      );

  static TextStyle get buttonLabelBase => GoogleFonts.shareTechMono(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 3,
      );

  static TextStyle get captionBase => GoogleFonts.shareTechMono(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 1,
      );

  static TextStyle get terminalPromptBase => GoogleFonts.shareTechMono(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5,
        height: 1.8,
      );

  // ─── Semantic helpers ──────────────────────────────────────────────────────

  /// Card title in Electric Cyan with soft glow (always same regardless of mode).
  static TextStyle cardTitleCyan(Color electricCyan) => cardTitleBase.copyWith(
        color: electricCyan,
        shadows: [
          Shadow(
            color: electricCyan.withOpacity(0.8),
            offset: Offset.zero,
            blurRadius: 5,
          ),
        ],
      );

  /// Section heading in Hot Magenta — used for named section labels.
  static TextStyle sectionHeadingMagenta(Color hotMagenta) =>
      sectionHeadingBase.copyWith(color: hotMagenta);

  /// Hero headline with dual-layer glow (dark mode optimized).
  static TextStyle heroWithGlow(Color baseColor) => heroHeadlineBase.copyWith(
        color: baseColor,
        shadows: AppShadows.headlineGlowDark,
      );

  /// Apply a single neon glow to any style.
  static TextStyle withGlow(
    TextStyle style,
    Color color, {
    double blur = 10,
  }) =>
      style.copyWith(
        shadows: [Shadow(color: color, offset: Offset.zero, blurRadius: blur)],
      );

  /// Apply an intense double-layer glow for hero emphasis.
  static TextStyle withIntenseGlow(TextStyle style, Color color) =>
      style.copyWith(
        shadows: [
          Shadow(
              color: color.withOpacity(0.8),
              offset: Offset.zero,
              blurRadius: 10),
          Shadow(
              color: color.withOpacity(0.4),
              offset: Offset.zero,
              blurRadius: 30),
        ],
      );
}
