import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/core/design_system/app_color_scheme.dart';
import 'package:portfolio/core/design_system/app_colors.dart';
import 'package:portfolio/core/design_system/app_shadows.dart';
import 'package:portfolio/core/design_system/app_spacing.dart';
import 'package:portfolio/core/design_system/app_text_styles.dart';
import 'package:portfolio/features/home/data/portfolio_data.dart';
import 'package:portfolio/features/home/domain/models.dart';
import 'package:portfolio/shared/widgets/section_header.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final vc = context.vaporColors;
    final isDesktop = MediaQuery.sizeOf(context).width >= 1024;

    final featured =
        PortfolioData.projects.where((p) => p.isFeatured).first;
    final others =
        PortfolioData.projects.where((p) => !p.isFeatured).toList();

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: AppSpacing.sectionPaddingDesktop,
        horizontal: 24,
      ),
      color: vc.voidBackground,
      child: Center(
        child: ConstrainedBox(
          constraints:
              const BoxConstraints(maxWidth: AppSpacing.maxWidthContent),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionHeader(
                label: 'PROJECTS',
                subtitle:
                    'Production-shipped products that reached real users.',
              )
                  .animate()
                  .fadeIn(duration: 600.ms)
                  .slideY(begin: 0.2),

              const SizedBox(height: 48),

              if (isDesktop) ...[
                // Featured card (wide) + right column (2 stacked)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 6,
                      child: _ProjectCard(
                        project: featured,
                        isFeatured: true,
                      )
                          .animate()
                          .fadeIn(duration: 700.ms, delay: 200.ms)
                          .slideY(begin: 0.1),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      flex: 4,
                      child: Column(
                        children: [
                          for (final (i, p) in others.take(2).indexed)
                            Padding(
                              padding:
                                  EdgeInsets.only(bottom: i < 1 ? 20 : 0),
                              child: _ProjectCard(project: p)
                                  .animate()
                                  .fadeIn(
                                      duration: 700.ms,
                                      delay: (300 + i * 150).ms)
                                  .slideY(begin: 0.1),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
                if (others.length > 2) ...[
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      for (final (i, p) in others.skip(2).indexed)
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                                right:
                                    i < others.skip(2).length - 1 ? 20 : 0),
                            child: _ProjectCard(project: p)
                                .animate()
                                .fadeIn(
                                    duration: 700.ms,
                                    delay: (500 + i * 150).ms)
                                .slideY(begin: 0.1),
                          ),
                        ),
                    ],
                  ),
                ],
              ] else ...[
                for (final (i, p) in PortfolioData.projects.indexed)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: _ProjectCard(
                      project: p,
                      isFeatured: p.isFeatured,
                    )
                        .animate()
                        .fadeIn(duration: 700.ms, delay: (i * 150).ms)
                        .slideY(begin: 0.1),
                  ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Project Card ────────────────────────────────────────────────────────────

class _ProjectCard extends StatefulWidget {
  const _ProjectCard({
    required this.project,
    this.isFeatured = false,
  });

  final Project project;
  final bool isFeatured;

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _hovered = false;

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    final vc = context.vaporColors;
    final brightness = Theme.of(context).brightness;
    final p = widget.project;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _launch(p.url),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.translationValues(0, _hovered ? -6 : 0, 0),
          padding: const EdgeInsets.all(AppSpacing.cardPadding),
          decoration: BoxDecoration(
            color: vc.glassPanel,
            border: Border(
              top: BorderSide(
                  color: vc.electricCyan, width: AppSpacing.borderDefault),
              left: BorderSide(
                  color: vc.hotMagenta.withOpacity(0.3), width: 1),
              right: BorderSide(
                  color: vc.hotMagenta.withOpacity(0.3), width: 1),
              bottom: BorderSide(
                  color: vc.hotMagenta.withOpacity(0.15), width: 1),
            ),
            boxShadow: _hovered
                ? AppShadows.cardHover(brightness)
                : AppShadows.cyanGlowSm,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Badge row
              Row(
                children: [
                  if (widget.isFeatured)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 3),
                      color: vc.hotMagenta,
                      child: Text(
                        'FEATURED',
                        style: AppTextStyles.captionBase.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  if (widget.isFeatured) const SizedBox(width: 10),
                  if (p.vaporwaveTagline != null)
                    Expanded(
                      child: Text(
                        p.vaporwaveTagline!,
                        style: AppTextStyles.captionBase.copyWith(
                          color: vc.sunsetOrange,
                          letterSpacing: 1.5,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                ],
              ),

              const SizedBox(height: 12),

              // Title
              Text(
                p.title.toUpperCase(),
                style: AppTextStyles.cardTitleBase.copyWith(
                  color: vc.electricCyan,
                  shadows: AppShadows.cyanTextGlow,
                  fontSize: widget.isFeatured ? 28 : 22,
                ),
              ),

              const SizedBox(height: 4),

              // Role
              Text(
                p.role,
                style: AppTextStyles.uiLabelBase.copyWith(
                  color: vc.hotMagenta,
                  fontSize: 12,
                  letterSpacing: 1.5,
                ),
              ),

              const SizedBox(height: 12),

              // Description
              Text(
                p.description,
                style: AppTextStyles.bodyMediumBase.copyWith(
                  color: vc.chromeText,
                  height: 1.5,
                ),
              ),

              if (p.impact != null) ...[
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: vc.electricCyan.withOpacity(0.5), width: 1),
                    color: vc.electricCyan.withOpacity(0.05),
                  ),
                  child: Text(
                    p.impact!,
                    style: AppTextStyles.uiLabelBase.copyWith(
                      color: vc.electricCyan,
                      fontSize: 11,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ],

              const SizedBox(height: 16),

              // Tech tags
              Wrap(
                spacing: 8,
                runSpacing: 6,
                children: p.techStack
                    .map((t) => _TechTag(label: t, vc: vc))
                    .toList(),
              ),

              const SizedBox(height: 20),

              // CTA
              ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (b) => AppColors.accentBarGradient
                    .createShader(Rect.fromLTWH(0, 0, b.width, b.height)),
                child: Text(
                  'VISIT SITE →',
                  style: AppTextStyles.buttonLabelBase.copyWith(
                    color: Colors.white,
                    fontSize: 13,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TechTag extends StatelessWidget {
  const _TechTag({required this.label, required this.vc});

  final String label;
  final VaporwaveColors vc;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        border: Border.all(color: vc.defaultBorder, width: 1),
        color: vc.cardBackground,
      ),
      child: Text(
        label,
        style: AppTextStyles.captionBase.copyWith(
          color: vc.mutedText,
          letterSpacing: 1,
        ),
      ),
    );
  }
}
