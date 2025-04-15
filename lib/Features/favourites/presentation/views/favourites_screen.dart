import 'package:flutter/material.dart';
import 'package:mauritania/Features/favourites/presentation/views/favourite_screen_body.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(child: FavouriteScreenBody()),
    );
  }
}
