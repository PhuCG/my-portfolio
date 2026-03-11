import 'package:flutter/material.dart';
import 'package:portfolio/core/design_system/app_color_scheme.dart';
import 'package:portfolio/core/design_system/app_colors.dart';
import 'package:portfolio/core/design_system/app_text_styles.dart';

/// Section heading following Vaporwave spec:
/// - Muted prefix label in electricCyan ("> _")
/// - Large Orbitron title in hotMagenta
/// - Accent bar gradient below (magenta → cyan)
class SectionHeader extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final vc = context.vaporColors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Prefix label
        Text(
          '$prefix ${label.toUpperCase()}.LOG',
          style: AppTextStyles.uiLabelBase.copyWith(
            color: vc.electricCyan,
            fontSize: 13,
            letterSpacing: 3,
          ),
        ),
        const SizedBox(height: 8),
        // Main heading
        Text(
          label.toUpperCase(),
          style: AppTextStyles.sectionHeadingBase.copyWith(
            color: vc.hotMagenta,
          ),
        ),
        const SizedBox(height: 12),
        // Gradient accent bar
        Container(
          height: 2,
          width: 120,
          decoration: const BoxDecoration(
            gradient: AppColors.accentBarGradient,
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 16),
          Text(
            subtitle!,
            style: AppTextStyles.bodyMediumBase.copyWith(
              color: vc.mutedText,
            ),
          ),
        ],
      ],
    );
  }
}
