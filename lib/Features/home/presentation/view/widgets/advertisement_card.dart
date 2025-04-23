import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mauritania/Features/home/presentation/view/widgets/advertisement_details.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/styles.dart';
import '../../../../../generated/assets.dart';

class AdvertisementCard extends StatefulWidget {
  final bool isVip;

  const AdvertisementCard({super.key, this.isVip = false});

  @override
  State<AdvertisementCard> createState() => _AdvertisementCardState();
}

class _AdvertisementCardState extends State<AdvertisementCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AdvertisementDetails(),
          ),
        );
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                // Product Image
                Container(
                  height: 140,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.grey.shade100,
                        Colors.grey.shade200,
                      ],
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    child: Image.asset(
                      Assets.imagesCar,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // Favorite Button
                Positioned(
                  top: 10,
                  right: 10,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Icon(
                        isFavorite
                            ? FluentIcons.heart_24_filled
                            : FluentIcons.heart_24_regular,
                        color: ColorsManager.primary,
                        size: 22,
                      ),
                    ),
                  ),
                ),

                // VIP Badge
                if (widget.isVip)
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.amber.shade600,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.amber.withOpacity(0.4),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          )
                        ],
                      ),
                      child: Text(
                        'sponsored',
                        style: TextStyles.bold_12.copyWith( color: Colors.white),
                      ),
                    ),
                  ),

                // Category Chip
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'سيارات',
                      style: TextStyles.medium_12.copyWith(
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Product Details
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'مرسيدس S-Class 2023',
                    style: TextStyles.bold_14.copyWith(height: 1.3),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '300,000 دولار',
                    style: TextStyles.bold_16.copyWith(
                      color: Colors.green.shade700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
