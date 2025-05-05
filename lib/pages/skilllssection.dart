import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = [
      'Flutter',
      'Dart',
      'REST API',
      'Git',
      'Firebase',
      "Bloc",
      "GetX"
    ];
    return Container(
      height: 500,
      padding: EdgeInsets.only(top: 200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Skills',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 12),
          Center(
            child: Wrap(
              spacing: 10,
              children:
                  skills.map((skill) => Chip(label: Text(skill))).toList(),
            ),
          )
        ],
      ),
    );
  }
}
