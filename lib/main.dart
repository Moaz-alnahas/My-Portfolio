import 'package:flutter/material.dart';
import 'package:moaz_port/pages/contactsection.dart';
import 'package:moaz_port/pages/herosection.dart';
import 'package:moaz_port/pages/mr_corner/mr_corner.dart';
import 'package:moaz_port/pages/navbar.dart';
import 'package:moaz_port/pages/projectsection.dart';
import 'package:moaz_port/pages/skilllssection.dart';
import 'package:moaz_port/pages/tammini/tamini.dart';

void main() {
  runApp(MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Portfolio',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: PortfolioHomePage(),
      routes: {
        '/mrcorn': (context) => MrCorner(),
        '/tamini': (context) => Tamini(),
      },
    );
  }
}

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey heroKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  void scrollToSection(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Container(
          color: Colors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NavBar(),
              HeroSection(key: heroKey),
              Center(
                child: Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      blurRadius: 100,
                      offset: Offset(0, 10),
                      spreadRadius: -1,
                      color: Colors.lightBlueAccent,
                    )
                  ]),
                  child: MaterialButton(
                    onPressed: () {
                      scrollToSection(skillsKey);
                    },
                    child: Text("Go to Skills"),
                    color: Colors.blue,
                    textColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 22, vertical: 14),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              SkillsSection(key: skillsKey),
              Center(
                child: Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      blurRadius: 100,
                      offset: Offset(0, 10),
                      spreadRadius: -1,
                      color: Colors.lightBlueAccent,
                    )
                  ]),
                  child: MaterialButton(
                    onPressed: () {
                      scrollToSection(projectsKey);
                    },
                    child: Text("Go To My Contacts"),
                    color: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 22, vertical: 14),
                    textColor: Colors.white,
                  ),
                ),
              ),
              ProjectsSection(key: projectsKey),
              SizedBox(
                height: 90,
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      blurRadius: 100,
                      offset: Offset(0, 10),
                      spreadRadius: -1,
                      color: Colors.lightBlueAccent,
                    )
                  ]),
                  child: MaterialButton(
                    onPressed: () {
                      scrollToSection(contactKey);
                    },
                    child: Text("Go To My Projects"),
                    padding: EdgeInsets.symmetric(horizontal: 22, vertical: 14),
                    color: Colors.blue,
                    textColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 90,
              ),
              ContactSection(key: contactKey),
            ],
          ),
        ),
      ),
    );
  }
}
