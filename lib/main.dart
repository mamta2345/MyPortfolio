// ignore_for_file: use_key_in_widget_constructors

import 'package:Portifolio/Home/correct_home.dart';
import 'package:Portifolio/Reusable_widget/side_bar_laptop.dart';
import 'package:Portifolio/splacescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Portfolio',
        themeMode:
            themeController.isDark.value ? ThemeMode.dark : ThemeMode.light,
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.black),
            bodyMedium: TextStyle(color: Colors.black),
          ),
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Colors.black,
          primaryColor: Colors.black,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
          ),
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(color: Colors.white),
          ),
        ),
        home: Builder(
          builder: (context) {
            // Use MediaQuery here
            final screenWidth = MediaQuery.of(context).size.width;

            if (screenWidth < 600) {
              return const SplaceScreen(); // Show on small screens
            } else {
              return NewHome(); // Show on large screens
            }
          },
        ),
      );
    });
  }
}
