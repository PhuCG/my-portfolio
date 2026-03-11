import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/core/design_system/app_color_scheme.dart';
import 'package:portfolio/core/design_system/app_spacing.dart';
import 'package:portfolio/core/design_system/app_text_styles.dart';
import 'package:portfolio/features/home/data/portfolio_data.dart';
import 'package:portfolio/features/home/domain/models.dart';
import 'package:portfolio/shared/widgets/animate_on_scroll.dart';
import 'package:portfolio/shared/widgets/section_header.dart';
import 'package:portfolio/shared/widgets/terminal_window.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

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
          constraints: const BoxConstraints(
            maxWidth: AppSpacing.maxWidthContent,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimateOnScroll(
                id: 'skills-header',
                child: SectionHeader(
                  label: 'SKILLS',
                  subtitle:
                      'Battle-tested technologies across the full product lifecycle.',
                ),
              ),

              const SizedBox(height: 48),

              isDesktop
                  ? IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: PortfolioData.skillGroups
                            .asMap()
                            .entries
                            .map(
                              (e) => Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    right:
                                        e.key <
                                            PortfolioData.skillGroups.length - 1
                                        ? 20
                                        : 0,
                                  ),
                                  child: _SkillCard(
                                    group: e.value,
                                    delay: (e.key * 150).ms,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    )
                  : Column(
                      children: PortfolioData.skillGroups
                          .asMap()
                          .entries
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: _SkillCard(
                                group: e.value,
                                delay: (e.key * 150).ms,
                              ),
                            ),
                          )
                          .toList(),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SkillCard extends StatelessWidget {
  const _SkillCard({required this.group, required this.delay});

  final SkillGroup group;
  final Duration delay;

  static const _accentColors = [
    Color(0xFF00FFFF), // electricCyan
    Color(0xFFFF00FF), // hotMagenta
    Color(0xFFFF9900), // sunsetOrange
  ];

  @override
  Widget build(BuildContext context) {
    final vc = context.vaporColors;
    final idx = PortfolioData.skillGroups.indexOf(group);
    final accent = _accentColors[idx % _accentColors.length];

    return AnimateOnScroll(
      id: 'skill-card-$idx',
      delay: delay,
      child: TerminalWindow(
        title: group.title,
        titleAccentColor: accent,
        statusText: '${group.skills.length} modules loaded',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: group.skills.map((skill) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '> ',
                    style: AppTextStyles.terminalPromptBase.copyWith(
                      color: accent,
                      fontSize: 14,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      skill,
                      style: AppTextStyles.bodyMediumBase.copyWith(
                        color: vc.chromeText,
                        fontSize: 14,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
