import 'package:flutter/material.dart';
import 'package:portfolio/core/design_system/app_color_scheme.dart';
import 'package:portfolio/core/design_system/app_colors.dart';
import 'package:portfolio/core/design_system/app_text_styles.dart';
import 'package:portfolio/shared/widgets/vapor_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final vc = context.vaporColors;

    return Scaffold(
      body: Stack(
        children: [
          // Background Void
          Container(color: vc.voidBackground),

          // Main Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Hero Headline — gradient text fill (sunset)
                ShaderMask(
                  shaderCallback: (bounds) =>
                      AppColors.sunsetGradient.createShader(
                    Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                  ),
                  child: Text(
                    'PHU NGUYEN',
                    style: AppTextStyles.heroHeadlineBase
                        .copyWith(color: Colors.white),
                  ),
                ),

                const SizedBox(height: 16),

                // Subtitle with Cyan Glow
                Text(
                  '> SENIOR FLUTTER DEVELOPER',
                  style: AppTextStyles.withGlow(
                    AppTextStyles.uiLabelBase.copyWith(
                      fontSize: 20,
                      color: vc.electricCyan,
                    ),
                    vc.electricCyan,
                  ),
                ),

                const SizedBox(height: 48),

                // Vapor Button
                VaporButton(
                  label: 'EXPLORE ARCHIVE',
                  onPressed: () {},
                ),
              ],
            ),
          ),

          // Global Scanlines Overlay (CRT effect)
          IgnorePointer(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    vc.scanlineColor,
                    Colors.transparent,
                    vc.scanlineColor,
                  ],
                  stops: const [0.0, 0.5, 1.0],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
