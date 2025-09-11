import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

AppBar customAppBar(context, {required String text}) {
  return AppBar(
    backgroundColor: Colors.white,
    centerTitle: true,
    title: Text(text, style: TextStyles.bold19, textAlign: TextAlign.center),
    leading: GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: const Icon(Icons.arrow_back_ios_new),
    ),
  );
}
