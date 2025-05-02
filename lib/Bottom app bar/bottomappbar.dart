// ignore_for_file: must_be_immutable

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NewLoginpageFormat extends StatefulWidget {
  NewLoginpageFormat(
      {super.key,
      required this.menuItems,
      required this.user,
      this.selectedButtonName});

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
  List menuItems = [];
  List subMenuItems = [];
  bool isDrawerOpen = true;
  int smallScreenWidthSize = 600;

  void getSubMenuItems() {
    if (NewLoginpageFormat.bodyWidget == null) {
      NewLoginpageFormat.currentSubmenuIndex = 0;
    }

    Map subtitles = widget.menuItems[NewLoginpageFormat.currentMenuIndex ??= 0]
            ['subtitle'] ??
        {};
    if (subtitles.isNotEmpty) {
      subMenuItems = subtitles.keys.toList();
    } else {
      subMenuItems = [];
    }
  }

  @override
  void initState() {
    NewLoginpageFormat.currentMenuIndex ??= 0;
    menuItems = widget.menuItems.map((menuItem) {
      return menuItem['title'].keys.first;
    }).toList();
    getSubMenuItems();
    super.initState();
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
              currentIndex: NewLoginpageFormat.currentMenuIndex ??= 0,
              onTap: (value) {
                setState(() {
                  NewLoginpageFormat.currentMenuIndex = value;
                  getSubMenuItems();
                });
              },
              items: widget.menuItems.map((icon) {
                int index = widget.menuItems.indexOf(icon);
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
                    : rowTOColumn([]),
                Expanded(
                  child: getbodyWidget(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget rowTOColumn(List<Widget> children) {
    return MediaQuery.of(context).size.width <= 600
        ? Wrap(children: children)
        : Row(children: children);
  }

  String getFormattedMenuPath() {
    String menu = (NewLoginpageFormat.currentMenuIndex != null)
        ? widget
            .menuItems[NewLoginpageFormat.currentMenuIndex!]['title'].keys.first
        : "";

    String submenu = (NewLoginpageFormat.currentSubmenuIndex != null &&
            subMenuItems.isNotEmpty &&
            NewLoginpageFormat.currentSubmenuIndex! < subMenuItems.length)
        ? " > ${subMenuItems[NewLoginpageFormat.currentSubmenuIndex!]}"
        : "";

    String button = (widget.selectedButtonName?.isNotEmpty ?? false)
        ? " > ${widget.selectedButtonName}"
        : "";

    return "$menu$submenu$button";
  }

  Widget myDrawerButton() {
    return Row(
      children: [
        Image.asset("assets/images/logo.png", width: 100, height: 150),
        SizedBox(width: 106),
        myVerticalDivider(),
        // 👉 thoda space between image and icon
        IconButton(
          icon: const Icon(
            Icons.menu,
            size: 30,
          ),
          onPressed: () {
            setState(() {
              isDrawerOpen = !isDrawerOpen;
            });
          },
        ),
        SizedBox(
          width: isDrawerOpen ? 204 : 54,
        ),
      ],
    );
  }

  Widget myVerticalDivider() {
    return Container(
      color: Colors.black,
      width: .5,
      height: 45,
    );
  }

  Widget myExpended() {
    return const Expanded(
      child: SizedBox(
        width: 1,
      ),
    );
  }

  Widget myImage(String assetLocation) {
    return Image(
      image: AssetImage(assetLocation),
      height: 40,
    );
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
                      ? Colors.grey // Selected button background
                      : Colors.transparent, // Default background
                  shape: RoundedRectangleBorder(
                    borderRadius: NewLoginpageFormat.currentSubmenuIndex == i
                        ? BorderRadius.circular(10) // Rounded selected
                        : BorderRadius.zero, // Square not selected
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

  Widget getbodyWidget() {
    final bodyWidget = NewLoginpageFormat.bodyWidget;
    NewLoginpageFormat.bodyWidget = null;

    Map<String, dynamic> titleSubtileValue =
        widget.menuItems[NewLoginpageFormat.currentMenuIndex ?? 0]['title'];
    if (kDebugMode) {
      print('v $titleSubtileValue');
    }
    if (titleSubtileValue[
            menuItems[NewLoginpageFormat.currentMenuIndex ?? 0]] ==
        null) {
      titleSubtileValue = widget
          .menuItems[NewLoginpageFormat.currentMenuIndex ?? 0]['subtitle'];
      if (kDebugMode) {
        print('v $titleSubtileValue');
      }
    }
    return bodyWidget ??
        widget.menuItems[NewLoginpageFormat.currentMenuIndex ?? 0]['title']
            [menuItems[NewLoginpageFormat.currentMenuIndex ?? 0]] ??
        widget.menuItems[NewLoginpageFormat.currentMenuIndex ?? 0]['subtitle']
            [subMenuItems[NewLoginpageFormat.currentSubmenuIndex ?? 0]];
  }

  Widget myDrawer() {
    return SizedBox(
      width: isDrawerOpen ? 220 : 70,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            if (isDrawerOpen)
              Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      myUserImage(),
                    ],
                  ),
                  Text(
                    '${widget.user!['firstName']} ${widget.user!['lastName']} ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text('(${widget.user!['roll']})'),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment
                        .center, // optional for left alignment
                    children: [
                      Text(
                        widget.user!['center'],
                        style: TextStyle(fontSize: 16), // optional styling
                      ),
                      SizedBox(height: 8), // spacing between text and toggle
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 8,
                    width: 200,
                  )
                ],
              ),
            const Divider(
              height: 1.5,
            ),
            SizedBox(
              height: 8,
            ),
            for (int j = 0; j <= menuItems.length - 1; j++)
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor:
                            NewLoginpageFormat.currentMenuIndex == j
                                ? Colors.grey[200]
                                : Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            widget.menuItems[j]['icon'],
                            size: 28,
                            color: NewLoginpageFormat.currentMenuIndex == j
                                ? Colors.black
                                : Colors.grey,
                          ),
                          if (isDrawerOpen)
                            myMenuTitle(menuItems[j],
                                NewLoginpageFormat.currentMenuIndex == j),
                          if (isDrawerOpen) myExpended(),
                          if (isDrawerOpen)
                            if (widget.menuItems[j]['subtitle'] != null)
                              Icon(
                                NewLoginpageFormat.currentMenuIndex == j
                                    ? Icons.remove
                                    : Icons.add,
                                color: NewLoginpageFormat.currentMenuIndex == j
                                    ? Colors.black
                                    : Colors.grey,
                              )
                        ],
                      ),
                    ),
                  ),
                  if (j == NewLoginpageFormat.currentMenuIndex && isDrawerOpen)
                    for (int k = 0; k <= subMenuItems.length - 1; k++)
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor:
                              NewLoginpageFormat.currentSubmenuIndex == k
                                  ? Colors.grey[300]
                                  : Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            NewLoginpageFormat.currentSubmenuIndex = k;
                          });
                        },
                        child: Row(
                          children: [
                            SizedBox(
                              width: NewLoginpageFormat.currentSubmenuIndex == k
                                  ? 18
                                  : 30,
                            ),
                            if (NewLoginpageFormat.currentSubmenuIndex == k)
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 12,
                                color:
                                    NewLoginpageFormat.currentSubmenuIndex == k
                                        ? Colors.black // Selected color
                                        : Colors.grey, // Default color
                              ),
                            myMenuTitle(subMenuItems[k],
                                NewLoginpageFormat.currentSubmenuIndex == k),
                          ],
                        ),
                      ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget myUserImage() {
    String initials = '';
    if (widget.user!['firstName'] != null && widget.user!['lastName'] != null) {
      initials = widget.user!['firstName']![0] + widget.user!['lastName']![0];
    } else if (widget.user!['firstName'] != null) {
      initials = widget.user!['firstName']![0];
    }
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(12), // square with rounded corners
        image: widget.user!['profileImage'] != null
            ? DecorationImage(
                image: NetworkImage(widget.user!['profileImage']!),
                fit: BoxFit.cover,
              )
            : null,
      ),
      alignment: Alignment.center,
      child: widget.user!['profileImage'] == null
          ? Text(
              initials,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            )
          : null,
    );
  }

  Widget myMenuTitle(String title, bool isSelectedCondition) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Text(
        title,
        overflow: TextOverflow.fade,
        style: TextStyle(
          fontWeight: isSelectedCondition ? FontWeight.bold : FontWeight.normal,
          color: isSelectedCondition ? Colors.black : Colors.black87,
          fontSize: isSelectedCondition ? 14 : 13,
        ),
      ),
    );
  }
}
