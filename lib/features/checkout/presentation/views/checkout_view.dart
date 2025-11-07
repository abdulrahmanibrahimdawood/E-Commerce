import 'package:e_commerce/core/helper_funcations/get_user.dart';
import 'package:e_commerce/core/repos/order_repo/order_repo.dart';
import 'package:e_commerce/core/services/get_it_services.dart';
import 'package:e_commerce/core/widgets/custom_app_bar_inside.dart';
import 'package:e_commerce/features/checkout/domain/entites/order_entity.dart';
import 'package:e_commerce/features/checkout/domain/entites/shipping_address_entity.dart';
import 'package:e_commerce/features/checkout/presentation/manager/add_order_cubit/add_order_cubit.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/add_order_cubit_bloc_builder.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:e_commerce/features/home/domain/entites/cart_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.cartEntity});
  static const routeName = 'checkout';
  final CartEntity cartEntity;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddOrderCubit(getIt.get<OrderRepo>()),
      child: Scaffold(
        appBar: buildAppBarInside(
          context,
          title: 'الشحن',
          showNotification: false,
        ),
        body: Provider.value(
          value: OrderEntity(
            uId: getUser().uId,
            cartEntity,
            shippingAddressEntity: ShippingAddressEntity(),
          ),
          child: AddOrderCubitBlocBuilder(child: const CheckoutViewBody()),
        ),
      ),
    );
  }
}
