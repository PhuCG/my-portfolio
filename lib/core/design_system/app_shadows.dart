import 'package:flutter/material.dart';

/// Neon glow shadow tokens for Vaporwave design system.
///
/// Rule: everything emits light — shadows are colored glows, not dark drops.
/// Hover states use 2-3x intensity of the base glow (see *Hover variants).
class AppShadows {
  AppShadows._();

  // ─── Dark Mode — Full Neon ─────────────────────────────────────────────────

  static const List<BoxShadow> magentaGlowSm = [
    BoxShadow(color: Color(0x99FF00FF), blurRadius: 10),
  ];

  static const List<BoxShadow> magentaGlowMd = [
    BoxShadow(color: Color(0xFFFF00FF), blurRadius: 20, spreadRadius: 2),
  ];

  static const List<BoxShadow> magentaGlowHover = [
    BoxShadow(color: Color(0xCCFF00FF), blurRadius: 30, spreadRadius: 4),
    BoxShadow(color: Color(0x66FF00FF), blurRadius: 60),
  ];

  static const List<BoxShadow> cyanGlowSm = [
    BoxShadow(color: Color(0x3300FFFF), blurRadius: 20),
  ];

  static const List<BoxShadow> cyanGlowMd = [
    BoxShadow(color: Color(0xCC00FFFF), blurRadius: 15),
  ];

  static const List<BoxShadow> cyanGlowLg = [
    BoxShadow(color: Color(0x3300FFFF), blurRadius: 50),
  ];

  static const List<BoxShadow> cyanGlowHover = [
    BoxShadow(color: Color(0xCC00FFFF), blurRadius: 30, spreadRadius: 4),
    BoxShadow(color: Color(0x6600FFFF), blurRadius: 60),
  ];

  // Card lifted state (translate + glow)
  static const List<BoxShadow> cardHoverDark = [
    BoxShadow(color: Color(0x4D00FFFF), blurRadius: 30, spreadRadius: 2),
    BoxShadow(color: Color(0x1AFF00FF), blurRadius: 60),
  ];

  // ─── Light Mode — Soft Glow ────────────────────────────────────────────────

  static const List<BoxShadow> magentaGlowSmLight = [
    BoxShadow(color: Color(0x33CC00CC), blurRadius: 8),
  ];

  static const List<BoxShadow> magentaGlowMdLight = [
    BoxShadow(color: Color(0x66CC00CC), blurRadius: 16),
  ];

  static const List<BoxShadow> magentaGlowHoverLight = [
    BoxShadow(color: Color(0x99CC00CC), blurRadius: 20, spreadRadius: 2),
    BoxShadow(color: Color(0x33CC00CC), blurRadius: 40),
  ];

  static const List<BoxShadow> cyanGlowSmLight = [
    BoxShadow(color: Color(0x33007A99), blurRadius: 8),
  ];

  static const List<BoxShadow> cyanGlowMdLight = [
    BoxShadow(color: Color(0x66007A99), blurRadius: 16),
  ];

  static const List<BoxShadow> cyanGlowHoverLight = [
    BoxShadow(color: Color(0x99007A99), blurRadius: 20, spreadRadius: 2),
    BoxShadow(color: Color(0x33007A99), blurRadius: 40),
  ];

  static const List<BoxShadow> cardHoverLight = [
    BoxShadow(color: Color(0x33CC00CC), blurRadius: 24, spreadRadius: 2),
    BoxShadow(color: Color(0x1A007A99), blurRadius: 48),
  ];

  // ─── Text Shadows ──────────────────────────────────────────────────────────

  static const List<Shadow> magentaTextGlow = [
    Shadow(color: Color(0xCCFF00FF), offset: Offset.zero, blurRadius: 10),
  ];

  static const List<Shadow> cyanTextGlow = [
    Shadow(color: Color(0xCC00FFFF), offset: Offset.zero, blurRadius: 8),
  ];

  static const List<Shadow> headlineGlowDark = [
    Shadow(color: Color(0x80FFFFFF), offset: Offset.zero, blurRadius: 10),
    Shadow(color: Color(0x99FF00FF), offset: Offset.zero, blurRadius: 30),
  ];

  static const List<Shadow> headlineGlowLight = [
    Shadow(color: Color(0x33CC00CC), offset: Offset.zero, blurRadius: 8),
  ];

  // ─── Context-aware helpers ─────────────────────────────────────────────────

  static List<BoxShadow> magentaMd(Brightness brightness) =>
      brightness == Brightness.dark ? magentaGlowMd : magentaGlowMdLight;

  static List<BoxShadow> magentaHover(Brightness brightness) =>
      brightness == Brightness.dark ? magentaGlowHover : magentaGlowHoverLight;

  static List<BoxShadow> cyanMd(Brightness brightness) =>
      brightness == Brightness.dark ? cyanGlowMd : cyanGlowMdLight;

  static List<BoxShadow> cyanHover(Brightness brightness) =>
      brightness == Brightness.dark ? cyanGlowHover : cyanGlowHoverLight;

  static List<BoxShadow> cardHover(Brightness brightness) =>
      brightness == Brightness.dark ? cardHoverDark : cardHoverLight;
}
