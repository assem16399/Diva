import 'package:diva/core/helpers/constants.dart';
import 'package:diva/core/helpers/spacing.dart';
import 'package:diva/core/themes/text_styles.dart';
import 'package:diva/core/widgets/header_icon.dart';
import 'package:diva/features/product_details/widgets/available_colors.dart';
import 'package:diva/features/product_details/widgets/available_sizes.dart';
import 'package:diva/features/product_details/widgets/product_description.dart';
import 'package:diva/features/product_details/widgets/product_reviews_summary.dart';
import 'package:diva/features/product_details/widgets/product_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 426.h,
                  width: double.infinity,
                  color: Colors.red,
                ),
                SafeArea(
                  child: Padding(
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
                ),
              ],
            ),
            verticalSpace(24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ProductTitle(
                            title: 'Elegant wrapped dress',
                          ),
                          ProductReviewsSummary(
                            review: 4.9,
                            totalReviews: 1000,
                          ),
                        ],
                      ),
                    ],
                  ),
                  verticalSpace(12.h),
                  Text(
                    '580 L.E',
                    style: TextStyles.font20BlackW600,
                  ),
                  verticalSpace(12.h),
                  const ProductDescription(
                    description:
                        'Italian silky dress with wrapped waist bla bla bla '
                        'bla bla bla bla bla',
                  ),
                  verticalSpace(12.h),
                  const SelectedValueText(valueTitle: 'Color', value: 'Brown'),
                  verticalSpace(8.h),
                  const AvailableColors(),
                  verticalSpace(12.h),
                  const SelectedValueText(
                    valueTitle: 'Your size',
                    value: 'Large',
                  ),
                  verticalSpace(8.h),
                  const AvailableSizes(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectedValueText extends StatelessWidget {
  const SelectedValueText({
    required this.value,
    required this.valueTitle,
    super.key,
  });
  final String value;
  final String valueTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          valueTitle,
          style: TextStyles.font20BlackW600,
        ),
        Text(
          ' : ',
          style: TextStyles.font16BlackW400,
        ),
        Text(
          value,
          style: TextStyles.font16BlackW400,
        ),
      ],
    );
  }
}
