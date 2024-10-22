import 'package:diva/core/helpers/constants.dart';
import 'package:diva/core/helpers/spacing.dart';
import 'package:diva/core/themes/text_styles.dart';
import 'package:diva/core/widgets/header_icon.dart';
import 'package:diva/core/widgets/images_slider.dart';
import 'package:diva/features/product_details/logic/product_details_cubit.dart';
import 'package:diva/features/product_details/logic/product_details_state.dart';
import 'package:diva/features/product_details/ui/widgets/available_colors.dart';
import 'package:diva/features/product_details/ui/widgets/available_sizes.dart';
import 'package:diva/features/product_details/ui/widgets/product_description.dart';
import 'package:diva/features/product_details/ui/widgets/product_details_bottom_actions.dart';
import 'package:diva/features/product_details/ui/widgets/product_reviews_summary.dart';
import 'package:diva/features/product_details/ui/widgets/product_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        builder: (context, state) {
          return state.productDataState.when(
              loading: () => const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
              loaded: (product) {
                return Column(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 426.h,
                                  width: double.infinity,
                                  child: ImagesSlider(
                                    height: 426.h,
                                    width: double.infinity,
                                    images: [
                                      product.image ?? '',
                                    ],
                                  ),
                                ),
                                verticalSpace(24.h),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 24.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              ProductTitle(
                                                title: product.title ?? '',
                                              ),
                                              ProductReviewsSummary(
                                                review:
                                                    product.rating?.rate ?? 0.0,
                                                totalReviews:
                                                    product.rating?.count ?? 0,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      verticalSpace(12.h),
                                      Text(
                                        '${product.price?.toStringAsFixed(2)} L.E',
                                        style: TextStyles.font20BlackW600,
                                      ),
                                      verticalSpace(12.h),
                                      ProductDescription(
                                        description: product.description ?? '',
                                      ),
                                      verticalSpace(12.h),
                                      const SelectedValueText(
                                        valueTitle: 'Color',
                                        value: 'Brown',
                                      ),
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
                          SafeArea(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 16.h),
                      child: const SizedBox(
                        height: 48,
                        width: double.infinity,
                        child: ProductDetailsBottomActions(),
                      ),
                    ),
                  ],
                );
              },
              error: (error) {
                return Center(
                  child: Text(error),
                );
              });
        },
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
