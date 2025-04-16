import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:mauritania/Features/home/presentation/view/widgets/advertisement_details.dart';
import 'package:mauritania/core/theme/colors.dart';
import 'package:mauritania/core/theme/styles.dart';
import '../../../../../generated/assets.dart';

class FavouritesListViewItem extends StatefulWidget {
  const FavouritesListViewItem({super.key});

  @override
  State<FavouritesListViewItem> createState() => _FavoritesItemCardState();
}

class _FavoritesItemCardState extends State<FavouritesListViewItem> {
  bool isFavorite = true;

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
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image with Favorite Button
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12)),
                  child: Image.asset(
                    Assets.imagesCar,
                    width: double.infinity,
                    height: 140,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(isFavorite
                              ? 'تمت الإضافة إلى المفضلة'
                              : 'تمت الإزالة من المفضلة'),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                    child:Container(
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
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: ColorsManager.primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '300,000 دولار',
                      style: TextStyles.bold_14.copyWith(
                        color: Colors.white,
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
                    style: TextStyles.bold_16,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(
                        FluentIcons.tag_16_regular,
                        size: 16,
                        color: ColorsManager.primary80,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'سيارات',
                        style: TextStyles.regular_12.copyWith(
                          color: ColorsManager.primary80,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Seller Info
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundImage: const NetworkImage(
                            'https://randomuser.me/api/portraits/men/1.jpg'),
                        backgroundColor: ColorsManager.primary10,
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'محمد أحمد',
                            style: TextStyles.medium_14,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star_rounded,
                                size: 14,
                                color: Colors.amber[800],
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '4.9 (128 تقييم)',
                                style: TextStyles.regular_12.copyWith(
                                  color: ColorsManager.primary80,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
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