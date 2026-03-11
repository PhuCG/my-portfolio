import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';

/// Triggers entrance animation only when the widget first scrolls into view.
///
/// Wraps [child] with [VisibilityDetector] and replays [flutter_animate]
/// effects the moment at least [visibilityFraction] of the widget is visible.
/// Animations play once and do not repeat on re-entry.
class AnimateOnScroll extends StatefulWidget {
  const AnimateOnScroll({
    required this.id,
    required this.child,
    super.key,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 700),
    this.slideBeginY = 0.12,
    this.slideBeginX = 0.0,
    this.visibilityFraction = 0.06,
  });

  final String id;
  final Widget child;
  final Duration delay;
  final Duration duration;
  final double slideBeginY;
  final double slideBeginX;
  final double visibilityFraction;

  @override
  State<AnimateOnScroll> createState() => _AnimateOnScrollState();
}

class _AnimateOnScrollState extends State<AnimateOnScroll> {
  bool _triggered = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('aos-${widget.id}'),
      onVisibilityChanged: (info) {
        if (!_triggered && info.visibleFraction >= widget.visibilityFraction) {
          if (mounted) setState(() => _triggered = true);
        }
      },
      child: _triggered
          ? widget.child
              .animate(delay: widget.delay)
              .fadeIn(duration: widget.duration, curve: Curves.easeOut)
              .slideY(
                begin: widget.slideBeginY,
                end: 0,
                duration: widget.duration,
                curve: Curves.easeOut,
              )
              .slideX(
                begin: widget.slideBeginX,
                end: 0,
                duration: widget.duration,
                curve: Curves.easeOut,
              )
          : Opacity(opacity: 0, child: widget.child),
    );
  }
}

/// Convenience variant that slides in from the left (for timeline items, etc.)
class AnimateOnScrollX extends AnimateOnScroll {
  const AnimateOnScrollX({
    required super.id,
    required super.child,
    super.key,
    super.delay,
    super.duration,
    super.visibilityFraction,
  }) : super(slideBeginY: 0.0, slideBeginX: -0.08);
}
