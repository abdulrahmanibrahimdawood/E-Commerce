import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/core/widgets/notification_widget.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar() {
  return AppBar(
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: const NotificationWidget(),
      ),
    ],
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    title: const Text('الأكثر مبيعًا', style: TextStyles.bold19),
  );
}
