import 'package:diva/core/themes/styles.dart';
import 'package:flutter/material.dart';

class ProductTitle extends StatelessWidget {
  const ProductTitle({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyles.font16DarkGrayW400,
    );
  }
}
