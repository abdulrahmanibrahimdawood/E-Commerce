import 'package:e_commerce/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: const Column(
        children: [
          SizedBox(height: 24),
          CustomTextFormField(
            hintText: 'الاسم كامل',
            textInputType: TextInputType.text,
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            hintText: 'البريد الإلكتروني',
            textInputType: TextInputType.text,
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            hintText: 'العنوان',
            textInputType: TextInputType.text,
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            hintText: 'المدينه',
            textInputType: TextInputType.text,
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            hintText: 'رقم الطابق , رقم الشقه ..',
            textInputType: TextInputType.text,
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            hintText: 'رقم التليفون',
            textInputType: TextInputType.number,
          ),
        ],
      ),
    );
  }
}
