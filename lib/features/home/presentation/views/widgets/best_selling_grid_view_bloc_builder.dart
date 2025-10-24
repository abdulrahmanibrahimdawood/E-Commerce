import 'package:e_commerce/core/cubits/products_cubit/cubit/products_cubit.dart';
import 'package:e_commerce/core/helper_funcations/get_dummy_products.dart';
import 'package:e_commerce/core/widgets/custom_error_widget.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/best_selling_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BestSellingGridViewBlocBuilder extends StatelessWidget {
  const BestSellingGridViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return BestSellingGridView(products: state.products);
        } else if (state is ProductsFailure) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(text: state.errMessage),
          );
        } else {
          return Skeletonizer.sliver(
            enabled: true,
            child: BestSellingGridView(products: getDummyProducts()),
          );
        }
      },
    );
  }
}
