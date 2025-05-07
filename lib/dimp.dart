import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp Contact Demo',
      debugShowCheckedModeBanner: false,
      home: const WhatsAppScreen(),
    );
  }
}

class WhatsAppScreen extends StatelessWidget {
  const WhatsAppScreen({super.key});

  // Replace with your WhatsApp number (with country code, no + or spaces)
  final String phoneNumber = '6230777136';

  Future<void> _openWhatsAppChat(BuildContext context) async {
    final Uri url = Uri.parse("https://wa.me/$phoneNumber");
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open WhatsApp')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WhatsApp Contact'),
      ),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () => _openWhatsAppChat(context),
          icon: const Icon(Icons.chat),
          label: const Text("Chat on WhatsApp"),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
        ),
      ),
    );
  }
}
