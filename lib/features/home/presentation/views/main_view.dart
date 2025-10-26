import 'package:e_commerce/features/home/presentation/views/cart_view.dart';
import 'package:e_commerce/features/home/presentation/views/home_view.dart';
import 'package:e_commerce/features/home/presentation/views/products_view.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  static const routeName = 'home_view';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentViewIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        onItemTapped: (index) {
          setState(() {
            currentViewIndex = index;
          });
        },
      ),
      body: SafeArea(
        child: IndexedStack(
          index: currentViewIndex,
          children: [HomeView(), ProductsView(), CartView()],
        ),
      ),
    );
  }
}
