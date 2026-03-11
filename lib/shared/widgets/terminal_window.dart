import 'package:flutter/material.dart';
import 'package:portfolio/core/design_system/app_color_scheme.dart';
import 'package:portfolio/core/design_system/app_colors.dart';
import 'package:portfolio/core/design_system/app_shadows.dart';
import 'package:portfolio/core/design_system/app_text_styles.dart';

/// Retro OS terminal window chrome.
/// Mimics vintage OS interfaces: title bar with colored dots, content area.
class TerminalWindow extends StatelessWidget {
  const TerminalWindow({
    super.key,
    required this.title,
    required this.child,
    this.statusText,
    this.titleAccentColor,
  });

  final String title;
  final Widget child;
  final String? statusText;
  final Color? titleAccentColor;

  @override
  Widget build(BuildContext context) {
    final vc = context.vaporColors;
    final accentColor = titleAccentColor ?? vc.electricCyan;

    // LayoutBuilder detects whether the parent is stretching us to a fixed
    // height (e.g. IntrinsicHeight + CrossAxisAlignment.stretch in a Row).
    // When bounded, pin the status bar to the bottom via spaceBetween;
    // when unbounded (mobile stack), pack items naturally at the top.
    return LayoutBuilder(
      builder: (context, constraints) {
        final isBoundedHeight = constraints.hasBoundedHeight;

        return Container(
          decoration: BoxDecoration(
            color: vc.windowChromeBg,
            border: Border.all(color: accentColor, width: 2),
            boxShadow: AppShadows.cyanGlowSm,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: isBoundedHeight ? MainAxisSize.max : MainAxisSize.min,
            mainAxisAlignment: isBoundedHeight
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.start,
            children: [
              // ── Title bar ───────────────────────────────────────
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: accentColor.withValues(alpha: 0.1),
                  border: Border(
                    bottom: BorderSide(color: accentColor, width: 1),
                  ),
                ),
                child: Row(
                  children: [
                    // Window control dots
                    _dot(AppColors.hotMagenta),
                    const SizedBox(width: 6),
                    _dot(AppColors.electricCyan),
                    const SizedBox(width: 6),
                    _dot(AppColors.sunsetOrange),
                    const SizedBox(width: 14),
                    // Title
                    Text(
                      title.toUpperCase(),
                      style: AppTextStyles.uiLabelBase.copyWith(
                        color: accentColor,
                        fontSize: 12,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
              ),

              // ── Content ─────────────────────────────────────────
              Padding(padding: const EdgeInsets.all(20), child: child),

              // ── Optional status bar ──────────────────────────────
              if (statusText != null)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: vc.voidBackground,
                    border: Border(
                      top: BorderSide(
                        color: accentColor.withValues(alpha: 0.3),
                        width: 1,
                      ),
                    ),
                  ),
                  child: Text(
                    statusText!,
                    style: AppTextStyles.captionBase.copyWith(
                      color: vc.mutedText,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _dot(Color color) => Container(
    width: 12,
    height: 12,
    decoration: BoxDecoration(
      color: color,
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(color: color.withValues(alpha: 0.6), blurRadius: 4),
      ],
    ),
  );
}
