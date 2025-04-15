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
      onTap:  (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AdvertisementDetails(),
          ),
        );
      },
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white,
                    ColorsManager.primary60,
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: const DecorationImage(
                      image: AssetImage(
                          Assets.imagesCar),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'اسم المنتج - ماركة المنتج',
                              style: TextStyles.bold_16.copyWith(
                                color: ColorsManager.primary90,
                              ),
                            ),
                          ),
                          GestureDetector(
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
                            child: Icon(
                              isFavorite
                                  ? FluentIcons.heart_24_filled
                                  : FluentIcons.heart_24_regular,
                              color: ColorsManager.primary,
                              size: 25,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            FluentIcons.person_12_regular,
                            size: 16,
                            color: ColorsManager.primary80,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'اسم البائع',
                            style: TextStyles.regular_12.copyWith(
                              color: ColorsManager.primary80,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: ColorsManager.primary10,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.star_rounded,
                                  size: 14,
                                  color: Colors.amber[800],
                                ),
                                const SizedBox(width: 2),
                                Text(
                                  '4.8',
                                  style: TextStyles.bold_14.copyWith(
                                    color: ColorsManager.primary90,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'وصف المنتج - تفاصيل إضافية',
                        style: TextStyles.medium_12.copyWith(
                          color: ColorsManager.primary90,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        '\$45.99',
                        style: TextStyles.bold_18.copyWith(
                          color: ColorsManager.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: 4,
              decoration: BoxDecoration(
                color: ColorsManager.primary60,
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(24),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
