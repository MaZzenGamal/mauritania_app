import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../../generated/assets.dart';

class AdsBanner extends StatelessWidget {
  final List<String> imageUrls = const [
    Assets.imagesCar,
    Assets.imagesCar1,
    Assets.imagesCar2,
    Assets.imagesCar3,
    Assets.imagesCar4,
  ];

  const AdsBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          height: 200,
          autoPlay: true,
          enlargeCenterPage: true,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          autoPlayInterval: Duration(seconds: 6)),
      items: imageUrls.map((url) {
        return Builder(
          builder: (BuildContext context) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                url,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
