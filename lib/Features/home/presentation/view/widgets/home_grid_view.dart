import 'package:flutter/material.dart';
import 'package:mauritania/Features/home/presentation/view/widgets/advertisement_card.dart';

class HomeGridView extends StatelessWidget {
  const HomeGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate spacing based on screen width
        final screenWidth = constraints.maxWidth;
        final spacing = screenWidth * 0.03;

        return Padding(
          padding: EdgeInsets.all(spacing),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 6,
            clipBehavior: Clip.none,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 3,
              childAspectRatio: 0.62,
              crossAxisSpacing: spacing,
              mainAxisSpacing: spacing,
            ),
            itemBuilder: (context, index) {
              return const AdvertisementCard();
            },
          ),
        );
      },
    );
  }
}