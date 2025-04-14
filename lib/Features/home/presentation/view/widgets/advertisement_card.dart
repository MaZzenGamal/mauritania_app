import 'package:flutter/material.dart';
import 'package:mauritania/Features/home/presentation/view/widgets/advertisement_details.dart';

import '../../../../../core/theme/styles.dart';
import '../../../../../generated/assets.dart';

class AdvertisementCard extends StatefulWidget {
  const AdvertisementCard({super.key});

  @override
  State<AdvertisementCard> createState() => _AdvertisementCardState();
}

class _AdvertisementCardState extends State<AdvertisementCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PopScope(
              child: const AdvertisementDetails(),
            ),
          ),
        );
      },
      child: Container(
        width: 160,
        height: 250,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      Assets.imagesCar,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 3,
                  left: 3,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isFavorite ? Icons.favorite_rounded : Icons.favorite_outline_rounded,
                        size: 25,
                        color: isFavorite ? Colors.red : Colors.black, // Change color based on state
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Product title
            Text(
              'Whiting Cream',
              style: TextStyles.regular_12,
            ),
            const SizedBox(height: 4),

            // Star rating
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(3, (index) {
                return const Icon(Icons.star, color: Colors.amber, size: 16);
              }),
            ),
            const SizedBox(height: 4),

            // Price
            Text(
              '\$15.00',
              style: TextStyles.regular_12,
            ),
          ],
        ),
      ),
    );
  }
}
