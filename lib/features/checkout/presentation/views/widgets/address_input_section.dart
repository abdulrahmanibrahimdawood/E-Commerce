import 'package:e_commerce/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce/features/checkout/domain/entites/order_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 24),
          CustomTextFormField(
            onSaved: (value) {
              context.read<OrderEntity>().shippingAddressEntity!.name = value!;
            },
            hintText: 'الاسم كامل',
            textInputType: TextInputType.text,
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            onSaved: (value) {
              context.read<OrderEntity>().shippingAddressEntity!.email = value!;
            },
            hintText: 'البريد الإلكتروني',
            textInputType: TextInputType.text,
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            onSaved: (value) {
              context.read<OrderEntity>().shippingAddressEntity!.address =
                  value!;
            },
            hintText: 'العنوان',
            textInputType: TextInputType.text,
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            onSaved: (value) {
              context.read<OrderEntity>().shippingAddressEntity!.city = value!;
            },
            hintText: 'المدينه',
            textInputType: TextInputType.text,
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            onSaved: (value) {
              context
                      .read<OrderEntity>()
                      .shippingAddressEntity!
                      .addressDetails =
                  value!;
            },
            hintText: 'رقم الطابق , رقم الشقه ..',
            textInputType: TextInputType.text,
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            onSaved: (value) {
              context.read<OrderEntity>().shippingAddressEntity!.phone = value!;
            },
            hintText: 'رقم التليفون',
            textInputType: TextInputType.number,
          ),
        ],
      ),
    );
  }
}
