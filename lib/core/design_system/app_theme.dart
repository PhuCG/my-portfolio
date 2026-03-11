import 'package:flutter/material.dart';
import 'app_color_scheme.dart';
import 'app_text_styles.dart';

/// Vaporwave ThemeData factory.
///
/// Both themes share one builder [_buildTheme] — the [VaporwaveColors]
/// extension supplies the mode-specific tokens, so no duplication exists.
///
/// Usage:
///   MaterialApp(
///     theme:     AppTheme.lightTheme,
///     darkTheme: AppTheme.darkTheme,
///     themeMode: ref.watch(themeModeProvider),
///   )
class AppTheme {
  AppTheme._();

  static ThemeData get darkTheme =>
      _buildTheme(VaporwaveColors.dark, Brightness.dark);

  static ThemeData get lightTheme =>
      _buildTheme(VaporwaveColors.light, Brightness.light);

  static ThemeData _buildTheme(VaporwaveColors vc, Brightness brightness) {
    final isDark = brightness == Brightness.dark;

    return ThemeData(
      brightness: brightness,
      scaffoldBackgroundColor: vc.voidBackground,
      primaryColor: vc.hotMagenta,
      dividerColor: vc.defaultBorder,
      useMaterial3: true,

      // Inject Vaporwave tokens — access anywhere via context.vaporColors
      extensions: [vc],

      // ─── Color Scheme ───────────────────────────────────────────────────
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: vc.hotMagenta,
        onPrimary: isDark ? Colors.black : Colors.white,
        secondary: vc.electricCyan,
        onSecondary: isDark ? Colors.black : Colors.white,
        tertiary: vc.sunsetOrange,
        onTertiary: Colors.black,
        surface: vc.cardBackground,
        onSurface: vc.chromeText,
        error: const Color(0xFFFF4444),
        onError: Colors.white,
        outline: vc.defaultBorder,
        outlineVariant: vc.activeBorder,
      ),

      // ─── Card Theme — Glassmorphism + Dual Border ───────────────────────
      cardTheme: CardThemeData(
        color: vc.cardBackground,
        elevation: 0,
        shadowColor: vc.hotMagenta.withOpacity(0.3),
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: BorderSide(color: vc.hotMagenta.withOpacity(0.3), width: 1),
        ),
      ),

      // ─── Text Theme ─────────────────────────────────────────────────────
      textTheme: TextTheme(
        displayLarge: AppTextStyles.heroHeadlineBase
            .copyWith(color: vc.chromeText),
        displayMedium: AppTextStyles.sectionHeadingBase
            .copyWith(color: vc.hotMagenta),
        displaySmall: AppTextStyles.sectionHeadingMobile
            .copyWith(color: vc.hotMagenta),
        titleLarge: AppTextStyles.cardTitleCyan(vc.electricCyan),
        titleMedium: AppTextStyles.uiLabelBase.copyWith(
          fontSize: 18,
          color: vc.chromeText,
        ),
        bodyLarge: AppTextStyles.bodyLargeBase.copyWith(color: vc.chromeText),
        bodyMedium: AppTextStyles.bodyMediumBase.copyWith(color: vc.mutedText),
        labelLarge: AppTextStyles.uiLabelBase.copyWith(color: vc.chromeText),
        labelMedium: AppTextStyles.buttonLabelBase.copyWith(color: vc.chromeText),
        labelSmall: AppTextStyles.captionBase.copyWith(color: vc.mutedText),
      ),

      // ─── AppBar ─────────────────────────────────────────────────────────
      appBarTheme: AppBarTheme(
        backgroundColor: vc.voidBackground,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: AppTextStyles.uiLabelBase.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: vc.electricCyan,
        ),
        iconTheme: IconThemeData(color: vc.electricCyan),
      ),

      // ─── Input Decoration — Terminal Style (underline only) ─────────────
      inputDecorationTheme: InputDecorationTheme(
        filled: false,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: vc.hotMagenta, width: 2),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: vc.electricCyan, width: 2),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFFF4444), width: 2),
        ),
        hintStyle: AppTextStyles.uiLabelBase.copyWith(
          color: vc.hotMagenta.withOpacity(0.5),
        ),
        labelStyle:
            AppTextStyles.uiLabelBase.copyWith(color: vc.hotMagenta),
        errorStyle: AppTextStyles.captionBase.copyWith(
          color: const Color(0xFFFF4444),
        ),
      ),

      // ─── Divider ────────────────────────────────────────────────────────
      dividerTheme: DividerThemeData(
        color: vc.defaultBorder,
        thickness: 1,
      ),

      // ─── Icon Theme ─────────────────────────────────────────────────────
      iconTheme: IconThemeData(
        color: vc.electricCyan,
        size: 24,
      ),

      // ─── Tooltip ────────────────────────────────────────────────────────
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: vc.cardBackground,
          border: Border.all(color: vc.electricCyan, width: 1),
          borderRadius: BorderRadius.zero,
        ),
        textStyle: AppTextStyles.captionBase.copyWith(color: vc.chromeText),
      ),
    );
  }
}
