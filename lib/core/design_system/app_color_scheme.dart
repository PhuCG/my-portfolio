import 'package:flutter/material.dart';

/// Vaporwave design token carrier — extends MaterialTheme with custom tokens.
///
/// Usage: `context.vaporColors.hotMagenta`
///
/// Dark  = original Vaporwave spec (night void, neon glow).
/// Light = "Day-Glo Dawn" (pastel lavender sky, neon accents in daylight).
@immutable
class VaporwaveColors extends ThemeExtension<VaporwaveColors> {
  const VaporwaveColors({
    required this.voidBackground,
    required this.glassPanel,
    required this.cardBackground,
    required this.windowChromeBg,
    required this.chromeText,
    required this.mutedText,
    required this.hotMagenta,
    required this.electricCyan,
    required this.sunsetOrange,
    required this.defaultBorder,
    required this.activeBorder,
    required this.scanlineColor,
    required this.gridLineColor,
    required this.floatingSunFrom,
    required this.floatingSunTo,
  });

  // Backgrounds
  final Color voidBackground;
  final Color glassPanel;
  final Color cardBackground;
  final Color windowChromeBg;

  // Text
  final Color chromeText;
  final Color mutedText;

  // Neon Accents
  final Color hotMagenta;
  final Color electricCyan;
  final Color sunsetOrange;

  // Borders & Overlays
  final Color defaultBorder;
  final Color activeBorder;
  final Color scanlineColor;
  final Color gridLineColor;

  // Atmospheric
  final Color floatingSunFrom;
  final Color floatingSunTo;

  // ─── Palettes ──────────────────────────────────────────────────────────────

  /// Original Vaporwave spec: void/night, full neon saturation.
  static const VaporwaveColors dark = VaporwaveColors(
    voidBackground: Color(0xFF090014),
    glassPanel: Color(0xCC1A103C),
    cardBackground: Color(0xFF1A103C),
    windowChromeBg: Color(0xFF0A0820),
    chromeText: Color(0xFFE0E0E0),
    mutedText: Color(0xB3E0E0E0),
    hotMagenta: Color(0xFFFF00FF),
    electricCyan: Color(0xFF00FFFF),
    sunsetOrange: Color(0xFFFF9900),
    defaultBorder: Color(0xFF2D1B4E),
    activeBorder: Color(0xFF00FFFF),
    scanlineColor: Color(0x40000000),
    gridLineColor: Color(0xFFFF00FF),
    floatingSunFrom: Color(0xFFFF9900),
    floatingSunTo: Color(0xFFFF00FF),
  );

  /// Day-Glo Dawn: pastel lavender backdrop, neon accents remain vivid.
  static const VaporwaveColors light = VaporwaveColors(
    voidBackground: Color(0xFFF7F0FF),
    glassPanel: Color(0xB3FFFFFF),
    cardBackground: Color(0xFFEDE5FF),
    windowChromeBg: Color(0xFFE2D8FF),
    chromeText: Color(0xFF120028),
    mutedText: Color(0xFF4A3070),
    hotMagenta: Color(0xFFCC00CC),
    electricCyan: Color(0xFF007A99),
    sunsetOrange: Color(0xFFCC6600),
    defaultBorder: Color(0xFFC0A8EE),
    activeBorder: Color(0xFFCC00CC),
    scanlineColor: Color(0x0A000040),
    gridLineColor: Color(0xFFCC00CC),
    floatingSunFrom: Color(0xFFFF9900),
    floatingSunTo: Color(0xFFCC00CC),
  );

  // ─── ThemeExtension API ────────────────────────────────────────────────────

  @override
  VaporwaveColors copyWith({
    Color? voidBackground,
    Color? glassPanel,
    Color? cardBackground,
    Color? windowChromeBg,
    Color? chromeText,
    Color? mutedText,
    Color? hotMagenta,
    Color? electricCyan,
    Color? sunsetOrange,
    Color? defaultBorder,
    Color? activeBorder,
    Color? scanlineColor,
    Color? gridLineColor,
    Color? floatingSunFrom,
    Color? floatingSunTo,
  }) {
    return VaporwaveColors(
      voidBackground: voidBackground ?? this.voidBackground,
      glassPanel: glassPanel ?? this.glassPanel,
      cardBackground: cardBackground ?? this.cardBackground,
      windowChromeBg: windowChromeBg ?? this.windowChromeBg,
      chromeText: chromeText ?? this.chromeText,
      mutedText: mutedText ?? this.mutedText,
      hotMagenta: hotMagenta ?? this.hotMagenta,
      electricCyan: electricCyan ?? this.electricCyan,
      sunsetOrange: sunsetOrange ?? this.sunsetOrange,
      defaultBorder: defaultBorder ?? this.defaultBorder,
      activeBorder: activeBorder ?? this.activeBorder,
      scanlineColor: scanlineColor ?? this.scanlineColor,
      gridLineColor: gridLineColor ?? this.gridLineColor,
      floatingSunFrom: floatingSunFrom ?? this.floatingSunFrom,
      floatingSunTo: floatingSunTo ?? this.floatingSunTo,
    );
  }

  @override
  VaporwaveColors lerp(VaporwaveColors? other, double t) {
    if (other is! VaporwaveColors) return this;
    return VaporwaveColors(
      voidBackground: Color.lerp(voidBackground, other.voidBackground, t)!,
      glassPanel: Color.lerp(glassPanel, other.glassPanel, t)!,
      cardBackground: Color.lerp(cardBackground, other.cardBackground, t)!,
      windowChromeBg: Color.lerp(windowChromeBg, other.windowChromeBg, t)!,
      chromeText: Color.lerp(chromeText, other.chromeText, t)!,
      mutedText: Color.lerp(mutedText, other.mutedText, t)!,
      hotMagenta: Color.lerp(hotMagenta, other.hotMagenta, t)!,
      electricCyan: Color.lerp(electricCyan, other.electricCyan, t)!,
      sunsetOrange: Color.lerp(sunsetOrange, other.sunsetOrange, t)!,
      defaultBorder: Color.lerp(defaultBorder, other.defaultBorder, t)!,
      activeBorder: Color.lerp(activeBorder, other.activeBorder, t)!,
      scanlineColor: Color.lerp(scanlineColor, other.scanlineColor, t)!,
      gridLineColor: Color.lerp(gridLineColor, other.gridLineColor, t)!,
      floatingSunFrom: Color.lerp(floatingSunFrom, other.floatingSunFrom, t)!,
      floatingSunTo: Color.lerp(floatingSunTo, other.floatingSunTo, t)!,
    );
  }
}

/// BuildContext shorthand: `context.vaporColors.hotMagenta`
extension VaporwaveColorsX on BuildContext {
  VaporwaveColors get vaporColors =>
      Theme.of(this).extension<VaporwaveColors>()!;
}
