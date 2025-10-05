import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/widgets/fruit_item.dart';
import 'package:e_commerce/core/widgets/search_text_field.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/best_selling_header.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/featured_list.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: kTopPadding),
                CustomHomeAppBar(),
                SizedBox(height: kTopPadding),
                SearchTextField(),
                SizedBox(height: 12),
                FeaturedList(),
                SizedBox(height: 12),
                BestSellingHeader(),
                SizedBox(height: 12),
                FruitItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
