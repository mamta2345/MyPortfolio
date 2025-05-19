// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

class NewLoginpageFormat extends StatefulWidget {
  NewLoginpageFormat({
    super.key,
    required this.menuItems,
    required this.user,
    this.selectedButtonName,
  });

  final List<Map<String, dynamic>> menuItems;
  final Map<String, dynamic>? user;
  static Widget? bodyWidget;
  String? selectedButtonName;

  static int? currentMenuIndex;
  static int? currentSubmenuIndex;

  @override
  State<NewLoginpageFormat> createState() => _NewLoginpageFormatState();
}

class _NewLoginpageFormatState extends State<NewLoginpageFormat> {
  List<String> menuItems = [];
  List<String> subMenuItems = [];
  int smallScreenWidthSize = 600;

  @override
  void initState() {
    super.initState();
    NewLoginpageFormat.currentMenuIndex ??= 0;
    menuItems = widget.menuItems.map((menuItem) {
      return menuItem['title'].keys.first as String;
    }).toList();
    getSubMenuItems();
  }

  void getSubMenuItems() {
    final menuIndex = NewLoginpageFormat.currentMenuIndex ?? 0;
    final subtitles = widget.menuItems[menuIndex]['subtitle'] ?? {};
    setState(() {
      subMenuItems = subtitles.keys.toList().cast<String>();
      NewLoginpageFormat.currentSubmenuIndex ??= 0;
    });
  }

  void updateBodyWidget(Widget widget) {
    setState(() {
      NewLoginpageFormat.bodyWidget = widget;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: screenWidth <= smallScreenWidthSize
          ? BottomNavigationBar(
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
              currentIndex: NewLoginpageFormat.currentMenuIndex ?? 0,
              onTap: (value) {
                setState(() {
                  NewLoginpageFormat.currentMenuIndex = value;
                  NewLoginpageFormat.currentSubmenuIndex = 0;
                  getSubMenuItems();
                });
              },
              items: widget.menuItems.map((item) {
                int index = widget.menuItems.indexOf(item);
                return BottomNavigationBarItem(
                  icon: Icon(widget.menuItems[index]['icon']),
                  label: widget.menuItems[index]['title'].keys.first,
                );
              }).toList(),
            )
          : null,
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                screenWidth <= smallScreenWidthSize
                    ? mySubMenu()
                    : rowToColumn([]),
                Expanded(child: getBodyWidget()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget rowToColumn(List<Widget> children) {
    return MediaQuery.of(context).size.width <= smallScreenWidthSize
        ? Wrap(children: children)
        : Row(children: children);
  }

  Widget mySubMenu() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < subMenuItems.length; i++)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    NewLoginpageFormat.currentSubmenuIndex = i;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: NewLoginpageFormat.currentSubmenuIndex == i
                      ? Colors.grey
                      : Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: NewLoginpageFormat.currentSubmenuIndex == i
                        ? BorderRadius.circular(10)
                        : BorderRadius.zero,
                  ),
                  elevation:
                      NewLoginpageFormat.currentSubmenuIndex == i ? 2 : 0,
                ),
                child: Text(
                  subMenuItems[i],
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: NewLoginpageFormat.currentSubmenuIndex == i
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget getBodyWidget() {
    final customBody = NewLoginpageFormat.bodyWidget;

    if (customBody != null) {
      return customBody;
    }

    final menuIndex = NewLoginpageFormat.currentMenuIndex ?? 0;
    final subIndex = NewLoginpageFormat.currentSubmenuIndex ?? 0;

    final currentItem = widget.menuItems[menuIndex];
    final currentTitle = menuItems[menuIndex];

    final titleWidgets = currentItem['title'];
    final subtitleWidgets = currentItem['subtitle'];

    Widget? selectedWidget;

    if (titleWidgets.containsKey(currentTitle)) {
      selectedWidget = titleWidgets[currentTitle];
    } else if (subMenuItems.isNotEmpty &&
        subtitleWidgets.containsKey(subMenuItems[subIndex])) {
      selectedWidget = subtitleWidgets[subMenuItems[subIndex]];
    }

    return selectedWidget ?? const Center(child: Text("No Content"));
  }
}
