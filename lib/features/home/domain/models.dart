class Project {
  const Project({
    required this.id,
    required this.title,
    required this.role,
    required this.description,
    required this.techStack,
    required this.url,
    this.impact,
    this.vaporwaveTagline,
    this.isFeatured = false,
  });

  final String id;
  final String title;
  final String role;
  final String description;
  final List<String> techStack;
  final String url;
  final String? impact;
  final String? vaporwaveTagline;
  final bool isFeatured;
}

class SkillGroup {
  const SkillGroup({
    required this.title,
    required this.skills,
  });

  final String title;
  final List<String> skills;
}

class TimelineEntry {
  const TimelineEntry({
    required this.period,
    required this.role,
    required this.company,
    required this.url,
    required this.description,
    this.isHighlighted = false,
  });

  final String period;
  final String role;
  final String company;
  final String url;
  final String description;
  final bool isHighlighted;
}
