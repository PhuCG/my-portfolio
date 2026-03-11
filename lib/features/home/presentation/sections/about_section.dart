import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/core/design_system/app_color_scheme.dart';
import 'package:portfolio/core/design_system/app_shadows.dart';
import 'package:portfolio/core/design_system/app_spacing.dart';
import 'package:portfolio/core/design_system/app_text_styles.dart';
import 'package:portfolio/shared/widgets/section_header.dart';
import 'package:portfolio/shared/widgets/terminal_window.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  static const _aiTools = [
    ('cursor_ide.exe', 'AI-powered development environment'),
    ('gemini_api.exe', 'LLM-driven code generation'),
    ('figma_ai.exe', 'AI-accelerated UI prototyping'),
    ('firebase_ai.exe', 'Intelligent backend integration'),
  ];

  @override
  Widget build(BuildContext context) {
    final vc = context.vaporColors;
    final isDesktop = MediaQuery.sizeOf(context).width >= 1024;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: AppSpacing.sectionPaddingDesktop,
        horizontal: 24,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints:
              const BoxConstraints(maxWidth: AppSpacing.maxWidthContent),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionHeader(
                label: 'ABOUT',
                subtitle: 'Philosophy & approach to engineering.',
              ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2),

              const SizedBox(height: 48),

              // Two-column layout on desktop
              isDesktop
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 3, child: _PersonaBlock(vc: vc)),
                        const SizedBox(width: 32),
                        Expanded(flex: 2, child: _AiEdgeBlock(vc: vc, tools: _aiTools)),
                      ],
                    )
                  : Column(
                      children: [
                        _PersonaBlock(vc: vc),
                        const SizedBox(height: 24),
                        _AiEdgeBlock(vc: vc, tools: _aiTools),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PersonaBlock extends StatelessWidget {
  const _PersonaBlock({required this.vc});
  final VaporwaveColors vc;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'A RESULTS-DRIVEN ENGINEER',
          style: AppTextStyles.cardTitleBase.copyWith(
            color: vc.electricCyan,
            shadows: AppShadows.cyanTextGlow,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Specializing in building scalable mobile applications and web solutions '
          'from concept to global deployment.\n\n'
          'Every line of code is deliberate — architected with Clean principles, '
          'tested for reliability, and shipped with professional CI/CD pipelines '
          'that deliver zero-downtime production releases.',
          style: AppTextStyles.bodyLargeBase.copyWith(color: vc.chromeText),
        ),
        const SizedBox(height: 24),
        // Architecture callout
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(color: vc.hotMagenta, width: 3),
            ),
            color: vc.hotMagenta.withOpacity(0.05),
          ),
          child: Text(
            '"Clean Architecture · SOLID Principles · Offline-First Reliability"',
            style: AppTextStyles.uiLabelBase.copyWith(
              color: vc.hotMagenta,
              fontSize: 13,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ],
    ).animate().fadeIn(duration: 700.ms, delay: 200.ms).slideX(begin: -0.1);
  }
}

class _AiEdgeBlock extends StatelessWidget {
  const _AiEdgeBlock({
    required this.vc,
    required this.tools,
  });
  final VaporwaveColors vc;
  final List<(String, String)> tools;

  @override
  Widget build(BuildContext context) {
    return TerminalWindow(
      title: 'AI_EDGE.SH',
      statusText: '> 40% PRODUCTIVITY BOOST ACHIEVED',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Early adopter of AI-enhanced development.\nNot just writing code — orchestrating intelligence.',
            style: AppTextStyles.bodyMediumBase.copyWith(color: vc.mutedText),
          ),
          const SizedBox(height: 16),
          for (final (name, desc) in tools)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Text(
                    '> ',
                    style: AppTextStyles.terminalPromptBase.copyWith(
                      color: vc.hotMagenta,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: AppTextStyles.uiLabelBase.copyWith(
                            color: vc.electricCyan,
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          desc,
                          style: AppTextStyles.captionBase.copyWith(
                            color: vc.mutedText,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    ).animate().fadeIn(duration: 700.ms, delay: 400.ms).slideX(begin: 0.1);
  }
}
