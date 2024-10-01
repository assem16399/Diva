import 'package:diva/core/helpers/constants.dart';
import 'package:diva/core/widgets/header_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HeaderIcon(
                    iconPath: SVGIcons.back,
                    onPressed: () {},
                  ),
                  HeaderIcon(
                    iconPath: SVGIcons.share,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const Center(
              child: Text('Product Details Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
