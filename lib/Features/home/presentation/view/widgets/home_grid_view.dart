import 'package:flutter/material.dart';
import 'package:mauritania/Features/home/presentation/view/widgets/advertisement_card.dart';

class HomeGridView extends StatelessWidget {
  const HomeGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final spacing = screenWidth * 0.03;

    return SliverPadding(
      padding: EdgeInsets.all(spacing),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
              (context, index) => const AdvertisementCard(),
          childCount: 6,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 3,
          crossAxisSpacing: spacing,
          mainAxisSpacing: spacing,
          childAspectRatio: 0.62,
        ),
      ),
    );
  }
}
