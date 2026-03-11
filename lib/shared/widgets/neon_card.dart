import 'package:flutter/material.dart';
import 'package:portfolio/core/design_system/app_color_scheme.dart';
import 'package:portfolio/core/design_system/app_shadows.dart';
import 'package:portfolio/core/design_system/app_spacing.dart';

/// Glassmorphism card following Vaporwave dual-border spec:
///   - Top: 2px solid [topAccentColor] (laser accent, default: electricCyan)
///   - Sides/bottom: 1px solid [hotMagenta @ 30%]
///   - Background: glassPanel (semi-transparent deep purple)
///   - Hover: lifts up 6px, cyan glow intensifies
class NeonCard extends StatefulWidget {
  const NeonCard({
    super.key,
    required this.child,
    this.topAccentColor,
    this.padding = const EdgeInsets.all(AppSpacing.cardPadding),
    this.onTap,
    this.isHoverable = true,
  });

  final Widget child;
  final Color? topAccentColor;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;
  final bool isHoverable;

  @override
  State<NeonCard> createState() => _NeonCardState();
}

class _NeonCardState extends State<NeonCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final vc = context.vaporColors;
    final brightness = Theme.of(context).brightness;
    final topColor = widget.topAccentColor ?? vc.electricCyan;

    return MouseRegion(
      onEnter: widget.isHoverable
          ? (_) => setState(() => _hovered = true)
          : null,
      onExit: widget.isHoverable
          ? (_) => setState(() => _hovered = false)
          : null,
      cursor: widget.onTap != null
          ? SystemMouseCursors.click
          : MouseCursor.defer,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.linear,
          transform: Matrix4.translationValues(0, _hovered ? -6 : 0, 0),
          padding: widget.padding,
          decoration: BoxDecoration(
            color: vc.glassPanel,
            border: Border(
              top: BorderSide(color: topColor, width: AppSpacing.borderDefault),
              left: BorderSide(
                color: vc.hotMagenta.withValues(alpha: 0.3),
                width: 1,
              ),
              right: BorderSide(
                color: vc.hotMagenta.withValues(alpha: 0.3),
                width: 1,
              ),
              bottom: BorderSide(
                color: vc.hotMagenta.withValues(alpha: 0.15),
                width: 1,
              ),
            ),
            boxShadow: _hovered
                ? AppShadows.cardHover(brightness)
                : AppShadows.cyanGlowSm,
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
