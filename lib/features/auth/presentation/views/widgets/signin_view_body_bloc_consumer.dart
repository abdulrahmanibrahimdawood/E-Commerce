import 'package:e_commerce/core/helper_funcations/build_error_bar.dart'
    show buildErrorBar;
import 'package:e_commerce/core/widgets/custom_progress_hud.dart';
import 'package:e_commerce/features/auth/presentation/managers/signin_cubit/signin_cubit.dart';
import 'package:e_commerce/features/auth/presentation/views/widgets/signin_view_body.dart';
import 'package:e_commerce/features/home/presentation/views/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninViewBodyBlocConsumer extends StatelessWidget {
  const SigninViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {
          Navigator.pushNamed(context, MainView.routeName);
        }
        if (state is SigninFailure) {
          buildErrorBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomProgressHUD(
          isLoading: state is SigninLoading ? true : false,
          child: SigninViewBody(),
        );
      },
    );
  }
}
