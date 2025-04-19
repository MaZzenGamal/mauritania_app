import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class InfoSection extends StatelessWidget {
  const InfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 45,
          backgroundColor: Colors.black12,
          child: Icon(Icons.person, size: 50, color: Colors.white),
        ),
        const SizedBox(height: 12),
        const Text(" محمد احمد",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const Text("exemple@gmail.com", style: TextStyle(color: Colors.grey)),
        const SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            _InfoCard(
                title: "طلباتي",
                value: "3",
                icon: FluentIcons.shopping_bag_24_regular),
            _InfoCard(
                title: "الرصيد",
                value: "300.00 ريال",
                icon: FluentIcons.wallet_24_regular),
            _InfoCard(
                title: "النقاط",
                value: "5",
                icon: Icons.monetization_on_outlined),
          ],
        ),
      ],
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _InfoCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 100,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: theme.primary.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, size: 32, color: theme.primary),
          const SizedBox(height: 6),
          Text(value,
              style: TextStyle(
                  color: theme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 14)),
          const SizedBox(height: 2),
          Text(title,
              style: const TextStyle(fontSize: 12, color: Colors.black87)),
        ],
      ),
    );
  }
}
