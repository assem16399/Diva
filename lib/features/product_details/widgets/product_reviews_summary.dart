import 'package:diva/core/themes/colors.dart';
import 'package:diva/core/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductReviewsSummary extends StatelessWidget {
  const ProductReviewsSummary({
    required this.review,
    required this.totalReviews,
    super.key,
  });

  final double review;
  final int totalReviews;

  @override
  Widget build(BuildContext context) {
    final formattedTotalReviews =
        totalReviews > 999 ? '999+' : totalReviews.toString();
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          Icon(
            Icons.star,
            color: ColorsManager.brightYellowOrangeColor,
            size: 20.sp,
          ),
          Text(
            '$review($formattedTotalReviews)',
            style: TextStyles.font12BlackHalfOpacityW400,
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: ColorsManager.blackWithHalfOpacity,
            size: 12.sp,
          ),
        ],
      ),
    );
  }
}
