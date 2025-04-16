import 'package:flutter/material.dart';

import 'favourites_list_view_item.dart';

class FavouritesListView extends StatelessWidget {
  const FavouritesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder:  (context, index) {
          return FavouritesListViewItem();
        },
        separatorBuilder:  (context, index) {
          return const SizedBox(height: 8,);
        },
        itemCount: 10);
  }
}
