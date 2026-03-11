import 'package:flutter/material.dart';
import 'package:portfolio/features/home/presentation/sections/about_section.dart';
import 'package:portfolio/features/home/presentation/sections/contact_section.dart';
import 'package:portfolio/features/home/presentation/sections/experience_section.dart';
import 'package:portfolio/features/home/presentation/sections/hero_section.dart';
import 'package:portfolio/features/home/presentation/sections/projects_section.dart';
import 'package:portfolio/features/home/presentation/sections/skills_section.dart';
import 'package:portfolio/shared/widgets/nav_bar.dart';
import 'package:portfolio/shared/widgets/scanline_overlay.dart';

/// GlobalKey registry for smooth-scroll navigation from the NavBar.
class SectionKeys {
  SectionKeys._();

  static final hero = GlobalKey();
  static final skills = GlobalKey();
  static final projects = GlobalKey();
  static final experience = GlobalKey();
  static final contact = GlobalKey();

  static Map<String, GlobalKey> get all => {
        'hero': hero,
        'skills': skills,
        'projects': projects,
        'experience': experience,
        'contact': contact,
      };
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _scrollController = ScrollController();
  double _scrollOffset = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(
      () => setState(() => _scrollOffset = _scrollController.offset),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: [
            // ── Scrollable page content ─────────────────────
            SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  // Hero — full viewport height
                  SizedBox(key: SectionKeys.hero, child: const HeroSection()),

                  // About
                  const AboutSection(),

                  // Skills
                  SizedBox(
                    key: SectionKeys.skills,
                    child: const SkillsSection(),
                  ),

                  // Projects
                  SizedBox(
                    key: SectionKeys.projects,
                    child: const ProjectsSection(),
                  ),

                  // Experience
                  SizedBox(
                    key: SectionKeys.experience,
                    child: const ExperienceSection(),
                  ),

                  // Contact + Footer
                  SizedBox(
                    key: SectionKeys.contact,
                    child: const ContactSection(),
                  ),
                ],
              ),
            ),

            // ── Sticky glass navigation ─────────────────────
            PortfolioNavBar(
              scrollOffset: _scrollOffset,
              sectionKeys: SectionKeys.all,
              scrollController: _scrollController,
            ),

            // ── Global CRT scanline overlay ─────────────────
            const ScanlineOverlay(),
          ],
      ),
    );
  }
}
