import 'package:flutter/material.dart';
import 'package:mauritania/Features/favourites/presentation/views/widgets/favourites_list_view.dart';
import 'package:mauritania/Features/favourites/presentation/views/widgets/favourites_list_view_item.dart';

import '../../../../core/theme/styles.dart';

class FavouriteScreenBody extends StatelessWidget {
  const FavouriteScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text(
                'المفضلة',
                style: TextStyles.bold_20,
              ),
            ),
            const SizedBox(height: 20),
            FavouritesListView()
          ]
        ),
      ),
    );
  }
}
