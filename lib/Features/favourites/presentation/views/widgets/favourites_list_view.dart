import 'package:flutter/material.dart';

import 'favourites_list_view_item.dart';

class FavouritesListView extends StatelessWidget {
  const FavouritesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.separated(
            itemBuilder:  (context, index) {
              return FavouritesListViewItem();
            },
            separatorBuilder:  (context, index) {
              return const SizedBox(height: 8,);
            },
            itemCount: 10),
      ),
    );
  }
}
