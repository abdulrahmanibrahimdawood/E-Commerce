import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/cubits/products_cubit/cubit/products_cubit.dart';
import 'package:e_commerce/core/widgets/custom_app_bar_.dart';
import 'package:e_commerce/core/widgets/search_text_field.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/best_selling_grid_view_bloc_builder.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/products_view_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getProducts();
    super.initState();
  }

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
                buildAppBar(context, title: 'المنتجات', showBackButton: false),
                SizedBox(height: kTopPadding),
                SearchTextField(),
                SizedBox(height: 12),
                ProductsViewHeader(
                  productsLength: context.read<ProductsCubit>().productsLength,
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
          ProductsGridViewBlocBuilder(),
        ],
      ),
    );
  }
}
