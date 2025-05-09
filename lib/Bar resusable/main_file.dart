// ignore_for_file: must_be_immutable

import 'package:Portifolio/Bottom%20app%20bar/bottomappbar.dart';
import 'package:Portifolio/Contact/contact.dart';
import 'package:Portifolio/Home/correct_home.dart';
import 'package:Portifolio/Resume/resume.dart';
import 'package:Portifolio/Skills/Skill.dart';
import 'package:flutter/material.dart';


class AdminLoginPage extends StatefulWidget {
  AdminLoginPage({
    super.key,
    this.bodyWidget,
    this.selectedButtonName,
  });
  Widget? bodyWidget;
  final String? selectedButtonName;

  @override
  State<AdminLoginPage> createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  Map<String, dynamic> user = {
    // 'firstName': 'Mamta',
    // 'lastName': 'Kumari',
    // "roll": "Flutter Developer",
    // 'profileImage': null,
    // 'center': 'C-DAC, Mohali',
    // 'center type': 'PI',
    // 'profile': AdminLoginPage(
    //   selectedButtonName: 'Admin Proflie',
    // )
  };
  List<Map<String, dynamic>> menuItems = [
    {
      'icon': Icons.info_outline,
      'title': <String, dynamic>{'About': NewHome()},
    },
    {
      'icon': Icons.build,
      'title': <String, dynamic>{'Skill': Skill()},
    },
    {
      'icon': Icons.contact_mail,
      'title': <String, dynamic>{'Contact': Contact()},
    },
    {
      'icon': Icons.folder,
      'title': <String, dynamic>{'Project': const Skill()},
    },
    {
      'icon': Icons.work,
      'title': <String, dynamic>{'Resume': ResumePage()},
    },
  ];

  @override
  Widget build(BuildContext context) {
    return NewLoginpageFormat(
      menuItems: menuItems,
      user: user,
    );
  }
}
