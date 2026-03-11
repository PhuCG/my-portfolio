/// Vaporwave layout and spacing tokens.
///
/// Based on design system spec: section padding py-20/py-32, gap-8/gap-12,
/// card padding p-6/p-8, max container widths max-w-7xl / max-w-5xl / max-w-4xl.
class AppSpacing {
  AppSpacing._();

  // ─── Section Vertical Rhythm ───────────────────────────────────────────────
  static const double sectionPaddingMobile = 80;   // py-20
  static const double sectionPaddingDesktop = 128; // py-32

  // ─── Component Gaps ────────────────────────────────────────────────────────
  static const double gapGrid = 32;   // gap-8
  static const double gapLarge = 48;  // gap-12
  static const double gapSmall = 16;  // gap-4

  // ─── Card & Container Padding ──────────────────────────────────────────────
  static const double cardPadding = 24;     // p-6
  static const double cardPaddingLg = 32;   // p-8
  static const double containerPaddingH = 16; // px-4 on mobile

  // ─── Max Container Widths ──────────────────────────────────────────────────
  static const double maxWidthContent = 1280; // max-w-7xl  — main sections
  static const double maxWidthHero = 1024;    // max-w-5xl  — hero text
  static const double maxWidthNarrow = 896;   // max-w-4xl  — FAQ, CTA

  // ─── Borders ───────────────────────────────────────────────────────────────
  static const double borderDefault = 2; // border-2
  static const double borderHeavy = 4;   // border-4

  // ─── Touch Targets & Button Heights ───────────────────────────────────────
  static const double touchTargetMin = 44;
  static const double buttonHeightSm = 36;  // h-9
  static const double buttonHeightMd = 48;  // h-12
  static const double buttonHeightLg = 56;  // h-14
  static const double iconButtonSize = 40;  // h-10 w-10

  // ─── Responsive Breakpoints ────────────────────────────────────────────────
  static const double breakpointSm = 640;
  static const double breakpointMd = 768;
  static const double breakpointLg = 1024;
  static const double breakpointXl = 1280;

  // ─── Z-Index Layers ────────────────────────────────────────────────────────
  // (Flutter uses Stack order — these are semantic names for documentation)
  // 0: Background grid (bottom of Stack)
  // 1: Floating sun gradient
  // 2: Section backgrounds
  // 3: Content
  // 4: Navigation
  // 5: Scanline overlay (top of Stack)
}
