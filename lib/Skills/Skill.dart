// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Skill extends StatefulWidget {
  const Skill({super.key});

  @override
  State<Skill> createState() => _SkillState();
}

class _SkillState extends State<Skill> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 211, 211, 211),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              texts("My Tech Stack", 35, FontWeight.bold),
              texts(" Technologies I’ve been working with recently", 16,
                  FontWeight.normal),
              SizedBox(height: 20),
              SizedBox(
                height: 200,
                width: double.infinity,
                child: Center(
                  child: Text(
                    "Yahan aur bhi content add kar sakte hain.",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget texts(
    String text,
    double size,
    FontWeight fontWeight,
  ) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          fontSize: size, fontWeight: fontWeight,
          // color: Colors.white,
        ),
      ),
    );
  }
}
