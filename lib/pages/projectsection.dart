import 'package:flutter/material.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      {
        'title': 'MR.Corner App',
        "url": "/mrcorn",
      },
      {
        'title': 'Tammini App',
        "url": "/tamini",
      },
    ];

    return Container(
      height: 500,
      padding: EdgeInsets.only(top: 200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text('Projects',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 12),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: projects
                .map((project) => Center(
                      child: SizedBox(
                        width: 350,
                        child: Card(
                          child: ListTile(
                            splashColor: Colors.transparent,
                            title: Text(project['title']!),
                            trailing: Icon(
                              Icons.pages,
                              color: Colors.blue,
                            ),
                            onTap: () {
                              Navigator.of(context).pushNamed(project["url"]!);
                            },
                          ),
                        ),
                      ),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
