import 'package:flutter/material.dart';
import 'package:mauritania/Features/home/presentation/view/widgets/category_filter_widget.dart';
import 'package:mauritania/Features/home/presentation/view/widgets/filter_sort_row.dart';
import 'package:mauritania/Features/home/presentation/view/widgets/home_app_bar.dart';
import 'package:mauritania/Features/home/presentation/view/widgets/home_grid_view.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HomeAppBar(),
          CategoryFilterWidget(),
          const SizedBox(height: 12),
          FilterSortRow(),
          HomeGridView()
        ],
      ),
    );
  }
}
