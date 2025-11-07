import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/repos/order_repo/order_repo.dart';
import 'package:e_commerce/features/checkout/domain/entites/order_entity.dart';
import 'package:equatable/equatable.dart';

part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  AddOrderCubit(this.orderRepo) : super(AddOrderInitial());
  final OrderRepo orderRepo;
  void addOrder({required OrderEntity order}) async {
    emit(AddOrderLoading());
    var result = await orderRepo.createOrder(order: order);
    result.fold(
      (failure) => emit(AddOrderFailure(errMessage: failure.message)),
      (success) => emit(AddOrderSuccess()),
    );
  }
}
