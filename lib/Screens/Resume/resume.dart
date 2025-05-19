import 'package:flutter/material.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SectionTitle(title: "Education"),
          TimelineTile(
            title: "Government PG College, Dharamshala",
            subtitle: "2021 – 2024",
            description: "B.Tech in CSE\n> 7 CGPA",
          ),
          TimelineTile(
            title: "Government Polytechnic College, Kangra",
            subtitle: "2019 – 2021",
            description: "Diploma in CSE\n69%",
          ),
          SizedBox(height: 24),
          SectionTitle(title: "Experience"),
          TimelineTile(
            title: "Flutter Developer",
            subtitle: "Aug 2024 – Present",
            description: "C-DAC, Mohali",
            bulletPoints: [
              "Developed and maintained mobile apps using Flutter.",
              "Collaborated with cross-functional teams.",
              "Worked on performance improvements.",
              "Participated in code reviews.",
            ],
          ),
          TimelineTile(
            title: "Android Developer (Training)",
            subtitle: "Jan 2024 – Jun 2024",
            description: "Novem Control, Mohali",
            bulletPoints: [
              "Created Android budget tracker app.",
              "Provided real-time insights for better financial decisions.",
            ],
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.menu_book_rounded, color: Colors.amber),
        const SizedBox(width: 8),
        Text(title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class TimelineTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? description;
  final List<String>? bulletPoints;

  const TimelineTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.description,
    this.bulletPoints,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 4),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade400,
                ),
              ),
              Container(
                width: 2,
                height: bulletPoints != null ? bulletPoints!.length * 20.0 : 40,
                color: Colors.grey.shade300,
              ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 4),
                Text(subtitle,
                    style: const TextStyle(color: Colors.orange, fontSize: 14)),
                if (description != null) ...[
                  const SizedBox(height: 4),
                  Text(description!,
                      style: const TextStyle(color: Colors.grey, fontSize: 14)),
                ],
                if (bulletPoints != null) ...[
                  const SizedBox(height: 8),
                  ...bulletPoints!
                      .map((point) => BulletPoint(text: point))
                      .toList(),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BulletPoint extends StatelessWidget {
  final String text;

  const BulletPoint({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("• ", style: TextStyle(fontSize: 16, height: 1.4)),
        Expanded(
          child: Text(text, style: const TextStyle(fontSize: 14, height: 1.4)),
        ),
      ],
    );
  }
}
