import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/core/design_system/app_color_scheme.dart';
import 'package:portfolio/core/design_system/app_colors.dart';
import 'package:portfolio/core/design_system/app_shadows.dart';
import 'package:portfolio/core/design_system/app_spacing.dart';
import 'package:portfolio/core/design_system/app_text_styles.dart';
import 'package:portfolio/features/home/data/portfolio_data.dart';
import 'package:portfolio/shared/widgets/gradient_text.dart';
import 'package:portfolio/shared/widgets/perspective_grid.dart';
import 'package:portfolio/shared/widgets/vapor_button.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    final vc = context.vaporColors;
    final size = MediaQuery.sizeOf(context);
    final isDesktop = size.width >= 1024;

    // Use minHeight instead of fixed height so content can grow on small
    // viewports rather than overflowing. On normal screens the hero still
    // fills 100vh because of the minHeight constraint.
    final verticalPad = size.height < 700 ? 40.0 : 80.0;

    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: size.height),
      child: SizedBox(
        width: double.infinity,
        child: Stack(
        children: [
          // ── Floating sun orb ─────────────────────────────
          Positioned(
            top: size.height * 0.05,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 500,
                height: 500,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      vc.floatingSunFrom.withValues(alpha: 0.25),
                      vc.floatingSunTo.withValues(alpha: 0.15),
                      Colors.transparent,
                    ],
                    stops: const [0.0, 0.5, 1.0],
                  ),
                ),
              ),
            ),
          ),

          // ── Perspective grid at bottom ────────────────────
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: PerspectiveGrid(height: size.height * 0.45),
          ),

          // ── Main content ─────────────────────────────────
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: AppSpacing.maxWidthHero,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: verticalPad,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: isDesktop
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.center,
                  children: [
                    // Eyebrow label
                    Text(
                          '>_ FLUTTER DEVELOPER',
                          style: AppTextStyles.uiLabelBase.copyWith(
                            color: vc.electricCyan,
                            fontSize: 13,
                            letterSpacing: 4,
                          ),
                        )
                        .animate()
                        .fadeIn(duration: 600.ms, delay: 100.ms)
                        .slideY(begin: 0.3, duration: 500.ms),

                    const SizedBox(height: 16),

                    // Hero name — gradient fill
                    GradientText(
                          'PHU\nNGUYEN',
                          style: isDesktop
                              ? AppTextStyles.heroHeadlineBase
                              : AppTextStyles.heroHeadlineMobile,
                          textAlign: isDesktop
                              ? TextAlign.left
                              : TextAlign.center,
                        )
                        .animate()
                        .fadeIn(duration: 800.ms, delay: 300.ms)
                        .slideY(begin: 0.2, duration: 700.ms),

                    const SizedBox(height: 20),

                    // Subtitle
                    Text(
                      'SENIOR FLUTTER DEVELOPER\n& AI WORKFLOW SPECIALIST',
                      style: AppTextStyles.uiLabelBase.copyWith(
                        color: vc.electricCyan,
                        fontSize: isDesktop ? 18 : 14,
                        height: 1.7,
                        shadows: AppShadows.cyanTextGlow,
                      ),
                      textAlign: isDesktop ? TextAlign.left : TextAlign.center,
                    ).animate().fadeIn(duration: 600.ms, delay: 600.ms),

                    const SizedBox(height: 16),

                    // Tagline
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 560),
                      child: Text(
                        '"Architecting high-performance, production-ready mobile solutions with AI-enhanced efficiency."',
                        style: AppTextStyles.bodyMediumBase.copyWith(
                          color: vc.mutedText,
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: isDesktop
                            ? TextAlign.left
                            : TextAlign.center,
                      ),
                    ).animate().fadeIn(duration: 600.ms, delay: 800.ms),

                    SizedBox(height: size.height < 700 ? 20 : 40),

                    // Stats row
                    _StatsRow(stats: PortfolioData.stats, isDesktop: isDesktop)
                        .animate()
                        .fadeIn(duration: 600.ms, delay: 900.ms)
                        .slideY(begin: 0.2),

                    SizedBox(height: size.height < 700 ? 20 : 40),

                    // CTA buttons
                    Wrap(
                      spacing: 16,
                      runSpacing: 12,
                      alignment: isDesktop
                          ? WrapAlignment.start
                          : WrapAlignment.center,
                      children: [
                        VaporButton(
                          label: 'EXPLORE PROJECTS',
                          variant: VaporButtonVariant.primary,
                          onPressed: () {},
                        ),
                        VaporButton(
                          label: 'DOWNLOAD CV',
                          variant: VaporButtonVariant.secondary,
                          onPressed: () => _launch('mailto:abc@gmail.com'),
                        ),
                        VaporButton(
                          label: 'GITHUB →',
                          variant: VaporButtonVariant.ghost,
                          onPressed: () => _launch(PortfolioData.githubUrl),
                        ),
                      ],
                    ).animate().fadeIn(duration: 600.ms, delay: 1100.ms),
                  ],
                ),
              ),
            ),
          ),

          // Scroll indicator
          Positioned(
            bottom: 32,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  'SCROLL DOWN',
                  style: AppTextStyles.captionBase.copyWith(
                    color: vc.mutedText,
                    letterSpacing: 3,
                  ),
                ),
                const SizedBox(height: 8),
                Icon(
                      Icons.keyboard_arrow_down,
                      color: vc.electricCyan,
                      size: 20,
                    )
                    .animate(onPlay: (c) => c.repeat())
                    .moveY(
                      begin: 0,
                      end: 6,
                      duration: 1200.ms,
                      curve: Curves.easeInOut,
                    )
                    .then()
                    .moveY(begin: 6, end: 0, duration: 1200.ms),
              ],
            ),
          ),
        ],
        ),
      ),
    );
  }
}

class _StatsRow extends StatelessWidget {
  const _StatsRow({required this.stats, required this.isDesktop});

  final Map<String, String> stats;
  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    final entries = stats.entries.toList();
    return Wrap(
      spacing: 16,
      runSpacing: 12,
      alignment: isDesktop ? WrapAlignment.start : WrapAlignment.center,
      children: entries
          .map((e) => _StatCard(value: e.key, label: e.value))
          .toList(),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    final vc = context.vaporColors;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: vc.glassPanel,
        border: Border(
          top: BorderSide(color: vc.hotMagenta, width: 2),
          left: BorderSide(color: vc.defaultBorder, width: 1),
          right: BorderSide(color: vc.defaultBorder, width: 1),
          bottom: BorderSide(color: vc.defaultBorder, width: 1),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (b) => AppColors.sunsetGradient.createShader(
              Rect.fromLTWH(0, 0, b.width, b.height),
            ),
            child: Text(
              value,
              style: AppTextStyles.sectionHeadingBase.copyWith(
                color: Colors.white,
                fontSize: 32,
                letterSpacing: 0,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: AppTextStyles.captionBase.copyWith(
              color: vc.mutedText,
              letterSpacing: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
