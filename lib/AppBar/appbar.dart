import 'package:flutter/material.dart';

class Appbarreusable extends StatefulWidget {
  const Appbarreusable({super.key});

  @override
  State<Appbarreusable> createState() => _AppbarreusableState();
}

class _AppbarreusableState extends State<Appbarreusable> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: screenWidth > 600
          ? PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: AppBar(
                title: Row(
                  children: [
                    reuseImage("assets/images/logo.png", 80, 80),
                    const Spacer(),
                    // rowMenu(),
                  ],
                ),
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        theme.brightness == Brightness.dark
                            ? Colors.grey[850]!
                            : Colors.white,
                        theme.scaffoldBackgroundColor,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
              ),
            )
          : AppBar(
              title: Row(
                children: [
                  reuseImage("assets/images/logo.png", 80, 80),
                  const Spacer(),
                ],
              ),
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      theme.brightness == Brightness.dark
                          ? Colors.grey[850]!
                          : Colors.white,
                      theme.scaffoldBackgroundColor,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
    );
  }

  Widget reuseImage(String path, double height, double width) {
    return Image.asset(
      path,
      width: width,
      height: height,
      errorBuilder: (context, error, stackTrace) =>
          const Icon(Icons.image_not_supported, size: 40),
    );
  }
}
