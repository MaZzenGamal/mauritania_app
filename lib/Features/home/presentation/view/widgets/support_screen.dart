import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: const Text(
          'الدعم الفني',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(FluentIcons.arrow_left_24_regular, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'بحاجه إلى مساعدة؟',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'تواصل معنا من خلال أي من الطرق التالية:',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 30),
            _SupportOptionTile(
              icon: FluentIcons.mail_24_regular,
              title: 'البريد الإلكتروني',
              subtitle: 'support@example.com',
              onTap: () {},
            ),
            _SupportOptionTile(
              icon: FluentIcons.call_24_regular,
              title: 'الاتصال الهاتفي',
              subtitle: '+123-456-7890',
              onTap: () {},
            ),
            _SupportOptionTile(
              icon: FontAwesomeIcons.whatsapp,
              title: 'واتساب',
              subtitle: '+1234567890',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _SupportOptionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _SupportOptionTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        leading: Icon(icon, color: Colors.blueAccent, size: 28),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle),
        onTap: onTap,
        trailing: const Icon(FluentIcons.arrow_right_24_regular),
      ),
    );
  }
}
