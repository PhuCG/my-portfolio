import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/core/design_system/app_color_scheme.dart';
import 'package:portfolio/core/design_system/app_colors.dart';
import 'package:portfolio/core/design_system/app_shadows.dart';
import 'package:portfolio/core/design_system/app_spacing.dart';
import 'package:portfolio/core/design_system/app_text_styles.dart';
import 'package:portfolio/features/home/data/portfolio_data.dart';
import 'package:portfolio/shared/widgets/terminal_window.dart';
import 'package:portfolio/shared/widgets/vapor_button.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    final vc = context.vaporColors;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: AppSpacing.sectionPaddingDesktop,
        horizontal: 24,
      ),
      decoration: BoxDecoration(
        color: vc.voidBackground,
        boxShadow: [
          BoxShadow(
            color: vc.hotMagenta.withOpacity(0.08),
            blurRadius: 100,
            offset: const Offset(0, -40),
          ),
        ],
      ),
      child: Center(
        child: ConstrainedBox(
          constraints:
              const BoxConstraints(maxWidth: AppSpacing.maxWidthNarrow),
          child: Column(
            children: [
              // Section intro
              ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (b) => AppColors.sunsetGradient
                    .createShader(Rect.fromLTWH(0, 0, b.width, b.height)),
                child: Text(
                  "LET'S BUILD\nTHE FUTURE",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.sectionHeadingBase.copyWith(
                    color: Colors.white,
                    fontSize: 56,
                    height: 1.1,
                  ),
                ),
              )
                  .animate()
                  .fadeIn(duration: 700.ms)
                  .slideY(begin: 0.2),

              const SizedBox(height: 20),

              Text(
                'Open to new opportunities, collaborations, and challenging problems.',
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyLargeBase.copyWith(
                  color: vc.mutedText,
                ),
              ).animate().fadeIn(duration: 600.ms, delay: 200.ms),

              const SizedBox(height: 48),

              // Terminal CTA card
              TerminalWindow(
                title: 'CONNECT.SH',
                statusText: '> Ready to deploy on the next mission',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Terminal prompt lines
                    _PromptLine(
                      prompt: '~',
                      command: 'ping phu@burningbros.com',
                      vc: vc,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'PONG — Response time: < 24h',
                      style: AppTextStyles.terminalPromptBase.copyWith(
                        color: vc.electricCyan,
                        shadows: AppShadows.cyanTextGlow,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // CTA Buttons
                    Wrap(
                      spacing: 16,
                      runSpacing: 12,
                      alignment: WrapAlignment.center,
                      children: [
                        VaporButton(
                          label: 'SEND EMAIL',
                          variant: VaporButtonVariant.primary,
                          onPressed: () => _launch(PortfolioData.email),
                        ),
                        VaporButton(
                          label: 'GITHUB',
                          variant: VaporButtonVariant.outline,
                          onPressed: () => _launch(PortfolioData.githubUrl),
                        ),
                        VaporButton(
                          label: 'LINKEDIN',
                          variant: VaporButtonVariant.ghost,
                          onPressed: () => _launch(PortfolioData.linkedinUrl),
                        ),
                      ],
                    ),
                  ],
                ),
              )
                  .animate()
                  .fadeIn(duration: 700.ms, delay: 400.ms)
                  .slideY(begin: 0.15),

              const SizedBox(height: 80),

              // Footer
              _Footer(vc: vc),
            ],
          ),
        ),
      ),
    );
  }
}

class _PromptLine extends StatelessWidget {
  const _PromptLine({
    required this.prompt,
    required this.command,
    required this.vc,
  });

  final String prompt;
  final String command;
  final VaporwaveColors vc;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$prompt > ',
          style: AppTextStyles.terminalPromptBase.copyWith(
            color: vc.hotMagenta,
            fontSize: 14,
          ),
        ),
        Expanded(
          child: Text(
            command,
            style: AppTextStyles.terminalPromptBase.copyWith(
              color: vc.chromeText,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer({required this.vc});

  final VaporwaveColors vc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: 1, color: vc.defaultBorder),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (b) => AppColors.accentBarGradient
                  .createShader(Rect.fromLTWH(0, 0, b.width, b.height)),
              child: Text(
                'PHU.DEV',
                style: AppTextStyles.uiLabelBase.copyWith(
                  color: Colors.white,
                  fontSize: 16,
                  letterSpacing: 4,
                ),
              ),
            ),
            Text(
              '< NGUYEN TRONG PHU / 2025 >',
              style: AppTextStyles.captionBase.copyWith(
                color: vc.mutedText,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
