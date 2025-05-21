// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:Portifolio/Screens/Bar%20resusable/main_file.dart';
import 'package:Portifolio/Screens/Home/correct_home.dart';
import 'package:flutter/material.dart';

class SplaceScreen extends StatefulWidget {
  const SplaceScreen({super.key});

  @override
  State<SplaceScreen> createState() => _SplaceScreenState();
}

class _SplaceScreenState extends State<SplaceScreen> {
  bool _animate = false; // Tracks animation state

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _animate = true;
      });
    });
    Future.delayed(Duration(seconds: 3), () {
      double screenWidth = MediaQuery.of(context).size.width;

      if (screenWidth < 600) {
        // Small screen -> go to Home page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AdminLoginPage()),
        );
      } else {
        // Large screen -> go to Admin page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => NewHome()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Animated Text (Slides from top)
              AnimatedSlide(
                offset: _animate ? Offset(0, 0) : Offset(0, -1), // Moves down
                duration: Duration(milliseconds: 800),
                child: AnimatedOpacity(
                  opacity: _animate ? 1 : 0, // Fades in
                  duration: Duration(milliseconds: 800),
                  child: Text(
                    "PORTFOLIO",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 35,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              // Animated Image (Slides from bottom)
              AnimatedSlide(
                offset: _animate ? Offset(0, 0) : Offset(0, 1), // Moves up
                duration: Duration(milliseconds: 800),
                child: AnimatedOpacity(
                  opacity: _animate ? 1 : 0, // Fades in
                  duration: Duration(milliseconds: 800),
                  child: Image.asset("assets/images/logo.png", width: 200),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
