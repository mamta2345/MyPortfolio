import 'package:Portifolio/Screens/About/about.dart';
import 'package:Portifolio/Screens/Contact/contact.dart';
import 'package:Portifolio/Screens/Resume/resume.dart';
import 'package:Portifolio/Skills/Skill.dart';
import 'package:flutter/material.dart';

class NewHome extends StatefulWidget {
  const NewHome({super.key});

  @override
  State<NewHome> createState() => _NewHomeState();
}

class _NewHomeState extends State<NewHome> with TickerProviderStateMixin {
  final PageController _pageController = PageController();
  late AnimationController _controller;
  int _currentIndex = 0;

  int smallScreenWidthSize = 700;

  void changePage(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _controller.dispose();
    super.dispose();
  }

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
                    rowMenu(),
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
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                Aboutpage(),
                Skill(),
                Contact(),
                Skill(),
                ResumePage(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget rowMenu() {
    return Row(
      children: [
        NavButton(
            title: "About",
            index: 0,
            currentIndex: _currentIndex,
            onTap: changePage),
        sizeBoxWidth(20),
        NavButton(
            title: "Skills",
            index: 1,
            currentIndex: _currentIndex,
            onTap: changePage),
        sizeBoxWidth(20),
        NavButton(
            title: "Contact",
            index: 2,
            currentIndex: _currentIndex,
            onTap: changePage),
        sizeBoxWidth(20),
        NavButton(
            title: "Project",
            index: 3,
            currentIndex: _currentIndex,
            onTap: changePage),
        sizeBoxWidth(20),
        NavButton(
            title: "Resume",
            index: 4,
            currentIndex: _currentIndex,
            onTap: changePage),
      ],
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

  Widget sizeBoxWidth(double width) => SizedBox(width: width);
}

class NavButton extends StatelessWidget {
  final String title;
  final int index;
  final int currentIndex;
  final Function(int) onTap;

  const NavButton({
    super.key,
    required this.title,
    required this.index,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = index == currentIndex;

    return TextButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        splashFactory: NoSplash.splashFactory,
        padding: MaterialStateProperty.all(EdgeInsets.zero),
      ),
      onPressed: () => onTap(index),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.black : Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}
