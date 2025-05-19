import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactIcon extends StatelessWidget {
  const ContactIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () async {
              final uri = Uri.parse(
                  'https://www.linkedin.com/in/mamta-kumari-178843239/');
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri, mode: LaunchMode.externalApplication);
              }
            },
            icon: SvgPicture.asset('assets/icons/linkedin.svg', height: 30),
          ),
          IconButton(
            onPressed: () async {
              final uri = Uri.parse('https://github.com/mamta2345');
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri, mode: LaunchMode.externalApplication);
              }
            },
            icon: SvgPicture.asset('assets/icons/github.svg', height: 30),
          ),
        ],
      ),
    );
  }
}
