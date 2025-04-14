import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mauritania/core/theme/colors.dart';
import 'package:clipboard/clipboard.dart'; // Add this import

import '../../../../../core/theme/styles.dart';

class SellerInfoSection extends StatelessWidget {
  const SellerInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(FluentIcons.person_24_filled, color: ColorsManager.primary),
            const SizedBox(width: 8),
            Text(
              'معلومات البائع',
              style: TextStyles.bold_18.copyWith(color: ColorsManager.primary),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              // Seller profile row
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                        image: NetworkImage(
                            'https://randomuser.me/api/portraits/men/1.jpg'),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'محمد أحمد',
                          style: TextStyles.bold_16.copyWith(
                            color: Colors.grey.shade800,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'عضوية منذ 2022',
                          style: TextStyles.regular_12.copyWith(
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.star_rounded,
                            color: Colors.amber.shade600, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          '4.9',
                          style: TextStyles.bold_14.copyWith(
                            color: Colors.blue.shade800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Divider(color: Colors.grey.shade200, height: 1),
              const SizedBox(height: 16),
              const ContactRow(
                icon: FluentIcons.call_24_regular,
                label: 'رقم الهاتف',
                value: '01012345678',
                iconColor: Colors.blue,
                successMessage: 'تم نسخ رقم الهاتف',
              ),
              const SizedBox(height: 12),
              const ContactRow(
                icon: FontAwesomeIcons.whatsapp,
                label: 'رقم الواتساب',
                value: '01098765432',
                iconColor: Colors.green,
                successMessage: 'تم نسخ رقم الواتساب',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ContactRow extends StatefulWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color iconColor;
  final String successMessage;

  const ContactRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.iconColor,
    required this.successMessage,
  });

  @override
  State<ContactRow> createState() => _ContactRowState();
}

class _ContactRowState extends State<ContactRow> {
  bool _copied = false;

  Future<void> _copyToClipboard() async {
    await FlutterClipboard.copy(widget.value);
    setState(() {
      _copied = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(widget.successMessage),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _copied = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _copyToClipboard,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: widget.iconColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(widget.icon, color: widget.iconColor, size: 20),
            ),
            const SizedBox(width: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.label,
                  style: TextStyles.regular_12.copyWith(
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  widget.value,
                  style: TextStyles.bold_15,
                ),
              ],
            ),
            const Spacer(),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: _copied ? Colors.green.shade50 : null,
                shape: BoxShape.circle,
              ),
              child: Icon(
                _copied
                    ? FluentIcons.checkmark_24_regular
                    : FluentIcons.copy_24_regular,
                color: _copied ? Colors.green : Colors.grey.shade500,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
