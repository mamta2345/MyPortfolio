import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  var isDark = false.obs;

  void toggleTheme() {
    isDark.value = !isDark.value;
  }
}

class SideBarLaptop extends StatefulWidget {
  const SideBarLaptop({super.key});

  @override
  State<SideBarLaptop> createState() => _SideBarLaptopState();
}

class _SideBarLaptopState extends State<SideBarLaptop> {
  final themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return sidebar(theme);
  }

  Widget sidebar(ThemeData theme) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 2,
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Profile image
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              image: const DecorationImage(
                image: AssetImage('assets/profile.jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(height: 12),

          // Name
          const Text(
            'Mamta Kumari',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),

          // Role
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'Flutter Developer',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 16),

          // Theme toggle
          Obx(() {
            return GestureDetector(
              onTap: () {
                themeController.toggleTheme();
              },
              child: Container(
                width: 70,
                height: 30,
                padding: const EdgeInsets.symmetric(horizontal: 6),
                decoration: BoxDecoration(
                  color: Colors.grey[850],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(Icons.wb_sunny, color: Colors.amber, size: 14),
                        Icon(Icons.nightlight_round,
                            color: Colors.grey, size: 14),
                      ],
                    ),
                    AnimatedAlign(
                      duration: const Duration(milliseconds: 300),
                      alignment: themeController.isDark.value
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: Colors.amber[400],
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          themeController.isDark.value
                              ? Icons.nightlight_round
                              : Icons.wb_sunny,
                          color: Colors.black,
                          size: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 10),

          // Info items
          _infoTile(Icons.email, 'EMAIL', 'mamta26121998@gmail.com'),
          _infoTile(Icons.linked_camera, 'LINKEDIN', 'LinkedIn.com/Amulya'),
          _infoTile(Icons.code, 'GITHUB', 'github.com/Amulya'),
          _infoTile(
              Icons.location_on, 'LOCATION', 'Kangra, Himachal Pradesh, India'),
          const SizedBox(height: 16),
          const Divider(),

          // Social media icons
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.facebook, size: 20),
              SizedBox(width: 20),
              Icon(Icons.travel_explore, size: 20),
            ],
          ),
        ],
      ),
    );
  }

  Widget _infoTile(IconData icon, String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.amber[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: Colors.white, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 12, color: Colors.grey, letterSpacing: 0.5)),
                Text(subtitle,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500))
              ],
            ),
          )
        ],
      ),
    );
  }
}
