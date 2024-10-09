import 'package:diva/core/themes/colors.dart';
import 'package:diva/core/themes/text_styles.dart';
import 'package:diva/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsBottomActions extends StatelessWidget {
  const ProductDetailsBottomActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: ColorsManager.veryLightGrayColor,
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite,
              color: Colors.black,
            ),
          ),
        ),
        Flexible(
          child: AppTextButton(
            buttonText: 'Buy now',
            textStyle: TextStyles.font18WhiteW400,
            buttonWidth: 155.w,
            onPressed: () {},
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: ColorsManager.veryLightGrayColor,
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
