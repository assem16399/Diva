import 'package:diva/core/themes/styles.dart';
import 'package:flutter/material.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    required this.description,
    super.key,
  });

  final String description;
  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: TextStyles.font12DarkGrayW400.copyWith(),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}
