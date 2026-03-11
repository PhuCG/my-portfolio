import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/core/design_system/app_color_scheme.dart';
import 'package:portfolio/core/design_system/app_shadows.dart';
import 'package:portfolio/core/design_system/app_spacing.dart';
import 'package:portfolio/core/design_system/app_text_styles.dart';
import 'package:portfolio/features/home/data/portfolio_data.dart';
import 'package:portfolio/features/home/domain/models.dart';
import 'package:portfolio/shared/widgets/animate_on_scroll.dart';
import 'package:portfolio/shared/widgets/section_header.dart';
import 'package:url_launcher/url_launcher.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final vc = context.vaporColors;
    final isDesktop = MediaQuery.sizeOf(context).width >= AppSpacing.breakpointLg;

    return Container(
      width: double.infinity,
      color: vc.voidBackground,
      padding: EdgeInsets.symmetric(
        vertical: isDesktop
            ? AppSpacing.sectionPaddingDesktop
            : AppSpacing.sectionPaddingMobile,
        horizontal: isDesktop ? 24 : 16,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints:
              const BoxConstraints(maxWidth: AppSpacing.maxWidthNarrow),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimateOnScroll(
                id: 'experience-header',
                child: SectionHeader(
                  label: 'EXPERIENCE',
                  subtitle: 'From intern to architect — the full timeline.',
                ),
              ),

              const SizedBox(height: 56),

              for (final (i, entry) in PortfolioData.timeline.indexed)
                AnimateOnScrollX(
                  id: 'timeline-$i',
                  delay: (i * 80).ms,
                  child: _TimelineItem(
                    entry: entry,
                    isLast: i == PortfolioData.timeline.length - 1,
                    isDesktop: isDesktop,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Timeline Item ────────────────────────────────────────────────────────────

class _TimelineItem extends StatefulWidget {
  const _TimelineItem({
    required this.entry,
    required this.isLast,
    required this.isDesktop,
  });

  final TimelineEntry entry;
  final bool isLast;
  final bool isDesktop;

  @override
  State<_TimelineItem> createState() => _TimelineItemState();
}

class _TimelineItemState extends State<_TimelineItem> {
  bool _hovered = false;

  Future<void> _launch(String url) async {
    if (url == '#') return;
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    final vc = context.vaporColors;

    // Rail dimensions — tighter on mobile
    final railWidth = widget.isDesktop ? 28.0 : 22.0;
    final railGap = widget.isDesktop ? 16.0 : 12.0;
    final dotSize = widget.isDesktop ? 14.0 : 12.0;

    final dotColor =
        widget.entry.isHighlighted ? vc.hotMagenta : vc.electricCyan;
    final dotGlow = widget.entry.isHighlighted
        ? AppShadows.magentaGlowSm
        : AppShadows.cyanGlowSm;
    final lineColor = widget.entry.isHighlighted
        ? vc.hotMagenta.withOpacity(0.4)
        : vc.defaultBorder;

    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ── Timeline rail ─────────────────────────────────────────────
            SizedBox(
              width: railWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Dot – centered in rail width
                  _AnimatedDot(
                    size: dotSize,
                    color: dotColor,
                    glow: dotGlow,
                    isHighlighted: widget.entry.isHighlighted,
                  ),
                  // Connecting line
                  if (!widget.isLast)
                    Expanded(
                      child: Center(
                        child: Container(
                          width: 2,
                          margin: const EdgeInsets.symmetric(vertical: 3),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [lineColor, lineColor.withOpacity(0.2)],
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),

            SizedBox(width: railGap),

            // ── Entry content ─────────────────────────────────────────────
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: MouseRegion(
                  onEnter: (_) => setState(() => _hovered = true),
                  onExit: (_) => setState(() => _hovered = false),
                  child: GestureDetector(
                    onTap: () => _launch(widget.entry.url),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: EdgeInsets.all(widget.isDesktop ? 20 : 16),
                      decoration: BoxDecoration(
                        color: _hovered
                            ? vc.cardBackground
                            : Colors.transparent,
                        border: Border(
                          left: BorderSide(
                            color: widget.entry.isHighlighted
                                ? vc.hotMagenta.withOpacity(
                                    _hovered ? 1.0 : 0.6,
                                  )
                                : vc.defaultBorder.withOpacity(
                                    _hovered ? 0.8 : 0.4,
                                  ),
                            width: _hovered ? 2 : 1,
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Period
                          Text(
                            widget.entry.period,
                            style: AppTextStyles.uiLabelBase.copyWith(
                              color: widget.entry.isHighlighted
                                  ? vc.hotMagenta
                                  : vc.electricCyan,
                              fontSize: 11,
                              letterSpacing: 2.5,
                              shadows: widget.entry.isHighlighted
                                  ? AppShadows.magentaTextGlow
                                  : AppShadows.cyanTextGlow,
                            ),
                          ),
                          const SizedBox(height: 6),

                          // Role
                          Text(
                            widget.entry.role.toUpperCase(),
                            style: AppTextStyles.cardTitleBase.copyWith(
                              color: vc.chromeText,
                              fontSize: widget.isDesktop ? 20 : 17,
                            ),
                          ),
                          const SizedBox(height: 4),

                          // Company
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '@ ',
                                style: AppTextStyles.uiLabelBase.copyWith(
                                  color: vc.hotMagenta,
                                  fontSize: 13,
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  widget.entry.company.toUpperCase(),
                                  style: AppTextStyles.uiLabelBase.copyWith(
                                    color: vc.electricCyan,
                                    fontSize: 13,
                                    letterSpacing: 1.5,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              if (widget.entry.url != '#') ...[
                                const SizedBox(width: 6),
                                Icon(
                                  Icons.open_in_new,
                                  color: vc.electricCyan.withOpacity(0.6),
                                  size: 13,
                                ),
                              ],
                            ],
                          ),
                          const SizedBox(height: 10),

                          // Description
                          Text(
                            widget.entry.description,
                            style: AppTextStyles.bodyMediumBase.copyWith(
                              color: vc.mutedText,
                              height: 1.6,
                              fontSize: widget.isDesktop ? 14 : 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Animated Dot (pulsing neon) ─────────────────────────────────────────────

class _AnimatedDot extends StatefulWidget {
  const _AnimatedDot({
    required this.size,
    required this.color,
    required this.glow,
    required this.isHighlighted,
  });

  final double size;
  final Color color;
  final List<BoxShadow> glow;
  final bool isHighlighted;

  @override
  State<_AnimatedDot> createState() => _AnimatedDotState();
}

class _AnimatedDotState extends State<_AnimatedDot>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulse;
  late final Animation<double> _glowScale;

  @override
  void initState() {
    super.initState();
    _pulse = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    _glowScale = Tween<double>(begin: 0.6, end: 1.4).animate(
      CurvedAnimation(parent: _pulse, curve: Curves.easeInOut),
    );

    if (widget.isHighlighted) {
      _pulse.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _pulse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _glowScale,
      builder: (context, child) {
        return Container(
          width: widget.size,
          height: widget.size,
          margin: const EdgeInsets.only(top: 6),
          decoration: BoxDecoration(
            color: widget.color,
            shape: BoxShape.rectangle,
            boxShadow: widget.isHighlighted
                ? widget.glow
                    .map(
                      (s) => BoxShadow(
                        color: s.color,
                        blurRadius: s.blurRadius * _glowScale.value,
                        spreadRadius: s.spreadRadius * _glowScale.value,
                        offset: s.offset,
                      ),
                    )
                    .toList()
                : widget.glow,
          ),
        );
      },
    );
  }
}
