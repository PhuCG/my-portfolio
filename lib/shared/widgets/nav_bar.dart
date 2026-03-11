import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/core/design_system/app_color_scheme.dart';
import 'package:portfolio/core/design_system/app_colors.dart';
import 'package:portfolio/core/design_system/app_shadows.dart';
import 'package:portfolio/core/design_system/app_text_styles.dart';
import 'package:portfolio/main.dart' show themeModeProvider;

/// Sticky navigation bar.
/// Becomes opaque + glass effect after scrolling past [_scrollThreshold].
class PortfolioNavBar extends ConsumerStatefulWidget {
  const PortfolioNavBar({
    super.key,
    required this.scrollOffset,
    required this.sectionKeys,
    required this.scrollController,
  });

  final double scrollOffset;
  final Map<String, GlobalKey> sectionKeys;
  final ScrollController scrollController;

  @override
  ConsumerState<PortfolioNavBar> createState() => _PortfolioNavBarState();
}

class _PortfolioNavBarState extends ConsumerState<PortfolioNavBar> {
  static const double _scrollThreshold = 80;
  bool _mobileMenuOpen = false;

  bool get _isScrolled => widget.scrollOffset > _scrollThreshold;

  void _scrollTo(String key) {
    setState(() => _mobileMenuOpen = false);
    final ctx = widget.sectionKeys[key]?.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
        alignment: 0.0,
      );
    }
  }

  static const _links = [
    ('SKILLS', 'skills'),
    ('PROJECTS', 'projects'),
    ('EXPERIENCE', 'experience'),
    ('CONTACT', 'contact'),
  ];

  @override
  Widget build(BuildContext context) {
    final vc = context.vaporColors;
    final brightness = Theme.of(context).brightness;
    final isDesktop = MediaQuery.sizeOf(context).width >= 1024;

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 64,
        decoration: BoxDecoration(
          color: _isScrolled
              ? vc.voidBackground.withValues(alpha: 0.92)
              : Colors.transparent,
          border: _isScrolled
              ? Border(bottom: BorderSide(color: vc.defaultBorder, width: 1))
              : null,
          boxShadow: _isScrolled ? AppShadows.cyanGlowSm : null,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Row(
            children: [
              // ── Logo ────────────────────────────────────────
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => _scrollTo('hero'),
                  child: ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (b) => AppColors.accentBarGradient
                        .createShader(Rect.fromLTWH(0, 0, b.width, b.height)),
                    child: Text(
                      'PHU.DEV',
                      style: AppTextStyles.cardTitleBase.copyWith(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),

              const Spacer(),

              // ── Desktop links ────────────────────────────────
              if (isDesktop) ...[
                for (final (label, key) in _links)
                  _NavLink(
                    label: label,
                    onTap: () => _scrollTo(key),
                    accentColor: vc.hotMagenta,
                  ),
                const SizedBox(width: 16),
                _ThemeToggle(brightness: brightness),
              ] else ...[
                _ThemeToggle(brightness: brightness),
                const SizedBox(width: 8),
                _HamburgerButton(
                  isOpen: _mobileMenuOpen,
                  color: vc.electricCyan,
                  onTap: () =>
                      setState(() => _mobileMenuOpen = !_mobileMenuOpen),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Sub-widgets ────────────────────────────────────────────────────────────

class _NavLink extends StatefulWidget {
  const _NavLink({
    required this.label,
    required this.onTap,
    required this.accentColor,
  });

  final String label;
  final VoidCallback onTap;
  final Color accentColor;

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final vc = context.vaporColors;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: _hovered ? widget.accentColor : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Text(
            widget.label,
            style: AppTextStyles.uiLabelBase.copyWith(
              color: _hovered ? vc.hotMagenta : vc.chromeText,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}

class _ThemeToggle extends ConsumerWidget {
  const _ThemeToggle({required this.brightness});

  final Brightness brightness;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vc = context.vaporColors;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => ref.read(themeModeProvider.notifier).toggle(),
        child: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            border: Border.all(color: vc.electricCyan, width: 1),
          ),
          child: Icon(
            brightness == Brightness.dark
                ? Icons.light_mode_outlined
                : Icons.dark_mode_outlined,
            color: vc.electricCyan,
            size: 18,
          ),
        ),
      ),
    );
  }
}

class _HamburgerButton extends StatelessWidget {
  const _HamburgerButton({
    required this.isOpen,
    required this.color,
    required this.onTap,
  });

  final bool isOpen;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Icon(isOpen ? Icons.close : Icons.menu, color: color, size: 24),
      ),
    );
  }
}
