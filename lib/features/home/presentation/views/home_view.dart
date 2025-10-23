import 'package:e_commerce/core/cubits/products_cubit/cubit/products_cubit.dart';
import 'package:e_commerce/core/repos/products_repo/product_repo.dart';
import 'package:e_commerce/core/services/get_it_services.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(getIt.get<ProductsRepo>()),
      child: HomeViewBody(),
    );
  }
}
