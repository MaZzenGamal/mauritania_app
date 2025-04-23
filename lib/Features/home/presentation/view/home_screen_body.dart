import 'package:flutter/material.dart';
import 'package:mauritania/Features/home/presentation/view/widgets/ads_banner.dart';
import 'package:mauritania/Features/home/presentation/view/widgets/advertisement_card.dart';
import 'package:mauritania/Features/home/presentation/view/widgets/category_filter_widget.dart';
import 'package:mauritania/Features/home/presentation/view/widgets/filter_sort_row.dart';
import 'package:mauritania/Features/home/presentation/view/widgets/home_app_bar.dart';
import 'package:mauritania/Features/home/presentation/view/widgets/home_grid_view.dart';
import 'package:mauritania/Features/home/presentation/view/widgets/sponsored_ads_section.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: HomeAppBar()),
        SliverToBoxAdapter(child: SizedBox(height: 12)),
        SliverToBoxAdapter(child: AdsBanner()),
        SliverToBoxAdapter(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Divider(
                color: Colors.grey.shade300,
                thickness: 1,
                height: 0,
                endIndent: 100,
                indent: 100,
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
        SliverToBoxAdapter(child: CategoryFilterWidget()),
        SliverToBoxAdapter(child: SizedBox(height: 12)),
        SliverToBoxAdapter(child: SponsoredAdsSection()),
        SliverToBoxAdapter(child: SizedBox(height: 20)),
        SliverToBoxAdapter(child: FilterSortRow()),
        HomeGridView(),
      ],
    );
  }
}
