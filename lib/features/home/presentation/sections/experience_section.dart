import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/core/design_system/app_color_scheme.dart';
import 'package:portfolio/core/design_system/app_shadows.dart';
import 'package:portfolio/core/design_system/app_spacing.dart';
import 'package:portfolio/core/design_system/app_text_styles.dart';
import 'package:portfolio/features/home/data/portfolio_data.dart';
import 'package:portfolio/features/home/domain/models.dart';
import 'package:portfolio/shared/widgets/section_header.dart';
import 'package:url_launcher/url_launcher.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final vc = context.vaporColors;
    final isDesktop = MediaQuery.sizeOf(context).width >= 1024;

    return Container(
      width: double.infinity,
      color: vc.voidBackground,
      padding: EdgeInsets.symmetric(
        vertical: AppSpacing.sectionPaddingDesktop,
        horizontal: 24,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints:
              const BoxConstraints(maxWidth: AppSpacing.maxWidthNarrow),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionHeader(
                label: 'EXPERIENCE',
                subtitle: 'From intern to architect — the full timeline.',
              ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2),

              const SizedBox(height: 56),

              // Timeline
              for (final (i, entry)
                  in PortfolioData.timeline.indexed)
                _TimelineItem(
                  entry: entry,
                  isLast: i == PortfolioData.timeline.length - 1,
                  delay: (i * 200).ms,
                  isDesktop: isDesktop,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TimelineItem extends StatefulWidget {
  const _TimelineItem({
    required this.entry,
    required this.isLast,
    required this.delay,
    required this.isDesktop,
  });

  final TimelineEntry entry;
  final bool isLast;
  final Duration delay;
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

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ── Timeline rail ──────────────────────────────────
          SizedBox(
            width: 48,
            child: Column(
              children: [
                // Checkpoint dot
                Container(
                  width: 16,
                  height: 16,
                  margin: const EdgeInsets.only(top: 6),
                  decoration: BoxDecoration(
                    color: widget.entry.isHighlighted
                        ? vc.hotMagenta
                        : vc.electricCyan,
                    shape: BoxShape.rectangle,
                    boxShadow: widget.entry.isHighlighted
                        ? AppShadows.magentaGlowSm
                        : AppShadows.cyanGlowSm,
                  ),
                ),
                // Connecting line
                if (!widget.isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            vc.defaultBorder,
                            vc.defaultBorder.withOpacity(0.3),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),

          const SizedBox(width: 20),

          // ── Entry content ──────────────────────────────────
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 36),
              child: MouseRegion(
                onEnter: (_) => setState(() => _hovered = true),
                onExit: (_) => setState(() => _hovered = false),
                child: GestureDetector(
                  onTap: () => _launch(widget.entry.url),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: _hovered
                          ? vc.cardBackground
                          : Colors.transparent,
                      border: Border(
                        left: BorderSide(
                          color: widget.entry.isHighlighted
                              ? vc.hotMagenta
                              : vc.defaultBorder,
                          width: 2,
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
                            fontSize: 12,
                            letterSpacing: 2,
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
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 4),

                        // Company
                        Row(
                          children: [
                            Text(
                              '@ ',
                              style: AppTextStyles.uiLabelBase.copyWith(
                                color: vc.hotMagenta,
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              widget.entry.company.toUpperCase(),
                              style: AppTextStyles.uiLabelBase.copyWith(
                                color: vc.electricCyan,
                                fontSize: 13,
                                letterSpacing: 1.5,
                              ),
                            ),
                            if (widget.entry.url != '#') ...[
                              const SizedBox(width: 6),
                              Icon(
                                Icons.open_in_new,
                                color: vc.electricCyan.withOpacity(0.6),
                                size: 14,
                              ),
                            ],
                          ],
                        ),
                        const SizedBox(height: 12),

                        // Description
                        Text(
                          widget.entry.description,
                          style: AppTextStyles.bodyMediumBase.copyWith(
                            color: vc.mutedText,
                            height: 1.6,
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
    )
        .animate()
        .fadeIn(duration: 700.ms, delay: widget.delay)
        .slideX(begin: -0.05);
  }
}
