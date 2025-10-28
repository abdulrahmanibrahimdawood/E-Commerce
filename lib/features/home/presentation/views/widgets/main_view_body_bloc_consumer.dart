import 'package:e_commerce/core/helper_funcations/build_error_bar.dart';
import 'package:e_commerce/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/main_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainViewBodyBlocConsumer extends StatelessWidget {
  const MainViewBodyBlocConsumer({super.key, required this.currentViewIndex});

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (State is CartItemAdded) {
          buildErrorBar(context, 'تم اضافة المنتج بنجاح');
        }
      },
      child: MainViewBody(currentViewIndex: currentViewIndex),
    );
  }
}
