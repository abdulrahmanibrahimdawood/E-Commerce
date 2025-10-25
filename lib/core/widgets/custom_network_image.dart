import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://skzbelzesdrnxhsthsat.supabase.co/storage/v1/object/public/$imageUrl',
    );
  }
}
