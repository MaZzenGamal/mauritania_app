import 'package:flutter/material.dart';
import 'advertisement_card.dart';

class SponsoredAdsSection extends StatelessWidget {
  const SponsoredAdsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280, // Enough height for card
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: 6,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          return SizedBox(
            width: 200,
            child: AdvertisementCard(isVip: true), // We'll pass this flag
          );
        },
      ),
    );
  }
}
