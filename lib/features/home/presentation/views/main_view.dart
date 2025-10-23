import 'package:e_commerce/features/home/presentation/views/home_view.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});
  static const String routeName = 'home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: SafeArea(child: const HomeView()),
    );
  }
}
