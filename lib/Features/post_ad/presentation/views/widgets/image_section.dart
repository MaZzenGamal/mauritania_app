import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/unified_button.dart';
import '../../../../../core/theme/colors.dart';


class ImagesSection extends StatelessWidget {
  final List<String> imageUrls;
  final VoidCallback onAddImage;
  final Function(int) onRemoveImage;
  final bool isUploading;

  const ImagesSection({
    super.key,
    required this.imageUrls,
    required this.onAddImage,
    required this.onRemoveImage,
    required this.isUploading,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Text(
                'إضافة صور',
                style: TextStyle(
                  color: ColorsManager.primaryDark,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              Text(
                ' *',
                style: TextStyle(
                  color: ColorsManager.accentDark,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'يمكنك رفع حتى 10 صور (الأولى ستكون الصورة الرئيسية)',
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: ColorsManager.grey600),
        ),
        const SizedBox(height: 12),
        UnifiedButton(
          onPressed: onAddImage,
          title: imageUrls.isEmpty
              ? 'إضافة صور'
              : 'إضافة المزيد (${10 - imageUrls.length} متبقي)',
          icon: FluentIcons.camera_add_20_regular,
          iconColor: Colors.white,
          textColor: Colors.white,
          color: ColorsManager.accent,
          isFullWidth: true,
          disabled: imageUrls.length >= 10,
          loading: isUploading,
          height: 50,
          elevation: 2,
          iconSize: 20,
          iconPadding: 8,
        ),
        if (imageUrls.isNotEmpty) ...[
          const SizedBox(height: 16),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: imageUrls.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Stack(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: ColorsManager.grey200, width: 1),
                          image: DecorationImage(
                            image: AssetImage(imageUrls[index]),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: ColorsManager.grey900.withOpacity(0.1),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 4,
                        right: 4,
                        child: GestureDetector(
                          onTap: () => onRemoveImage(index),
                          child: Container(
                            decoration: BoxDecoration(
                              color: ColorsManager.grey900.withOpacity(0.6),
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(4),
                            child: const Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                      if (index == 0)
                        Positioned(
                          bottom: 4,
                          left: 4,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: ColorsManager.primary,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              'رئيسية',
                              style: TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ],
    );
  }
}