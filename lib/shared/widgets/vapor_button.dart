import 'package:flutter/material.dart';
import 'package:portfolio/core/design_system/app_color_scheme.dart';
import 'package:portfolio/core/design_system/app_shadows.dart';
import 'package:portfolio/core/design_system/app_spacing.dart';
import 'package:portfolio/core/design_system/app_text_styles.dart';

enum VaporButtonVariant { primary, secondary, outline, ghost }

/// Vaporwave-style button with skew transform and neon glow hover.
///
/// - Resting: skewed -12deg, transparent background, neon border.
/// - Hovered:  un-skews to 0deg, fills with neon color, inverts text,
///             explodes with 2-3x glow intensity.
class VaporButton extends StatefulWidget {
  const VaporButton({
    super.key,
    required this.label,
    this.onPressed,
    this.variant = VaporButtonVariant.primary,
    this.size = VaporButtonSize.md,
  });

  final String label;
  final VoidCallback? onPressed;
  final VaporButtonVariant variant;
  final VaporButtonSize size;

  @override
  State<VaporButton> createState() => _VaporButtonState();
}

enum VaporButtonSize { sm, md, lg }

class _VaporButtonState extends State<VaporButton> {
  bool _isHovered = false;

  double get _height => switch (widget.size) {
    VaporButtonSize.sm => AppSpacing.buttonHeightSm,
    VaporButtonSize.md => AppSpacing.buttonHeightMd,
    VaporButtonSize.lg => AppSpacing.buttonHeightLg,
  };

  Color _accentColor(VaporwaveColors vc) => switch (widget.variant) {
    VaporButtonVariant.primary => vc.electricCyan,
    VaporButtonVariant.secondary => vc.hotMagenta,
    VaporButtonVariant.outline => vc.hotMagenta,
    VaporButtonVariant.ghost => vc.chromeText,
  };

  List<BoxShadow> _glowShadow(VaporwaveColors vc, Brightness brightness) {
    if (!_isHovered) return [];
    final isMagenta =
        widget.variant == VaporButtonVariant.secondary ||
        widget.variant == VaporButtonVariant.outline;
    return isMagenta
        ? AppShadows.magentaHover(brightness)
        : AppShadows.cyanHover(brightness);
  }

  @override
  Widget build(BuildContext context) {
    final vc = context.vaporColors;
    final brightness = Theme.of(context).brightness;
    final accent = _accentColor(vc);

    final isGhost = widget.variant == VaporButtonVariant.ghost;
    final isFilled = widget.variant == VaporButtonVariant.secondary;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.linear,
          height: _height,
          padding: const EdgeInsets.symmetric(horizontal: 32),
          transform: Matrix4.skewX(_isHovered ? 0 : -0.2),
          decoration: BoxDecoration(
            color: isGhost
                ? (_isHovered
                      ? vc.electricCyan.withValues(alpha: 0.1)
                      : Colors.transparent)
                : isFilled
                ? (_isHovered ? accent.withValues(alpha: 0.8) : accent)
                : (_isHovered ? accent : Colors.transparent),
            border: isGhost
                ? null
                : Border.all(color: accent, width: AppSpacing.borderDefault),
            boxShadow: _glowShadow(vc, brightness),
          ),
          child: Transform(
            // Counter-skew so text stays upright while container is skewed
            transform: Matrix4.skewX(_isHovered ? 0 : 0.2),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                widget.label.toUpperCase(),
                style: AppTextStyles.buttonLabelBase.copyWith(
                  color: _isHovered && !isFilled
                      ? (isGhost ? vc.electricCyan : Colors.black)
                      : isFilled
                      ? Colors.white
                      : accent,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
