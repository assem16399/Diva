import 'package:diva/core/helpers/extensions.dart';
import 'package:diva/core/themes/text_styles.dart';
import 'package:diva/core/widgets/app_text_button.dart';
import 'package:diva/core/widgets/success_dialog.dart';
import 'package:flutter/material.dart';

class ProductDetailsBottomActions extends StatelessWidget {
  const ProductDetailsBottomActions({
    required this.productTitle,
    super.key,
  });

  final String productTitle;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.5,
      child: AppTextButton(
        buttonText: 'Add to cart',
        textStyle: TextStyles.font18WhiteW400,
        onPressed: () {
          showAdaptiveDialog<dynamic>(
            context: context,
            builder: (context) => SuccessDialog(
              title: 'Great Choice',
              content: 'You have added $productTitle to your cart!',
              onActionPressed: () => context.pop(),
            ),
          );
        },
      ),
    );
  }
}
