import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/core/design_system/app_color_scheme.dart';
import 'package:portfolio/core/design_system/app_colors.dart';
import 'package:portfolio/core/design_system/app_text_styles.dart';

/// Section heading following the Vaporwave spec:
/// - Muted prefix label in electricCyan (">_ SECTION.LOG")
/// - Large Orbitron title in hotMagenta with a one-shot glitch on first reveal
/// - Animated gradient accent bar that expands from 0 → 120 px
class SectionHeader extends StatefulWidget {
  const SectionHeader({
    super.key,
    required this.label,
    this.subtitle,
    this.prefix = '>_',
  });

  final String label;
  final String? subtitle;
  final String prefix;

  @override
  State<SectionHeader> createState() => _SectionHeaderState();
}

class _SectionHeaderState extends State<SectionHeader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _barCtrl;
  late final Animation<double> _barWidth;

  @override
  void initState() {
    super.initState();
    _barCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _barWidth = CurvedAnimation(parent: _barCtrl, curve: Curves.easeOutCubic);

    // Slight delay so the bar animates after the fade-in from AnimateOnScroll.
    Future.delayed(const Duration(milliseconds: 400), () {
      if (mounted) _barCtrl.forward();
    });
  }

  @override
  void dispose() {
    _barCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vc = context.vaporColors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Prefix label — fades in with slight upward slide
        Text(
          '${widget.prefix} ${widget.label.toUpperCase()}.LOG',
          style: AppTextStyles.uiLabelBase.copyWith(
            color: vc.electricCyan,
            fontSize: 13,
            letterSpacing: 3,
          ),
        ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.3, duration: 400.ms),

        const SizedBox(height: 8),

        // Heading with one-shot glitch on reveal
        _GlitchText(
          text: widget.label.toUpperCase(),
          style: AppTextStyles.sectionHeadingBase.copyWith(
            color: vc.hotMagenta,
          ),
          glitchColor: vc.electricCyan,
        ),

        const SizedBox(height: 12),

        // Gradient accent bar — expands left-to-right
        AnimatedBuilder(
          animation: _barWidth,
          builder: (context, _) => Container(
            height: 2,
            width: 120 * _barWidth.value,
            decoration: const BoxDecoration(
              gradient: AppColors.accentBarGradient,
            ),
          ),
        ),

        if (widget.subtitle != null) ...[
          const SizedBox(height: 16),
          Text(
            widget.subtitle!,
            style: AppTextStyles.bodyMediumBase.copyWith(
              color: vc.mutedText,
            ),
          ).animate(delay: 200.ms).fadeIn(duration: 500.ms),
        ],
      ],
    );
  }
}

// ─── Glitch Text ─────────────────────────────────────────────────────────────

/// One-shot glitch effect: renders [text] with rapid horizontal jitter and
/// a brief chromatic-offset ghost in [glitchColor], then settles cleanly.
class _GlitchText extends StatefulWidget {
  const _GlitchText({
    required this.text,
    required this.style,
    required this.glitchColor,
  });

  final String text;
  final TextStyle style;
  final Color glitchColor;

  @override
  State<_GlitchText> createState() => _GlitchTextState();
}

class _GlitchTextState extends State<_GlitchText>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  final _rng = math.Random();

  // Current jitter offset — updated on each frame during glitch phase.
  double _jitterX = 0;
  double _jitterY = 0;
  double _ghostOpacity = 0;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _ctrl.addListener(_onTick);

    // Trigger after parent fade-in completes.
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) _ctrl.forward();
    });
  }

  void _onTick() {
    final t = _ctrl.value;
    // Glitch is active during first 50% of animation.
    if (t < 0.5) {
      setState(() {
        _jitterX = (_rng.nextDouble() - 0.5) * 6 * (1 - t * 2);
        _jitterY = (_rng.nextDouble() - 0.5) * 2 * (1 - t * 2);
        _ghostOpacity = (0.5 - t) * 0.7;
      });
    } else if (_jitterX != 0) {
      setState(() {
        _jitterX = 0;
        _jitterY = 0;
        _ghostOpacity = 0;
      });
    }
  }

  @override
  void dispose() {
    _ctrl.removeListener(_onTick);
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Ghost / chromatic-offset layer
        if (_ghostOpacity > 0)
          Positioned(
            left: -4 + _jitterX * 1.5,
            top: _jitterY,
            child: Opacity(
              opacity: _ghostOpacity,
              child: Text(
                widget.text,
                style: widget.style.copyWith(color: widget.glitchColor),
              ),
            ),
          ),

        // Main text with jitter
        Transform.translate(
          offset: Offset(_jitterX, _jitterY),
          child: Text(widget.text, style: widget.style),
        ),
      ],
    );
  }
}
