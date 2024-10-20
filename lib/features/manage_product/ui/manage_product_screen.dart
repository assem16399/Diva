import 'package:diva/core/helpers/spacing.dart';
import 'package:diva/core/themes/text_styles.dart';
import 'package:diva/core/widgets/app_drop_down_text_field.dart';
import 'package:diva/core/widgets/app_text_button.dart';
import 'package:diva/core/widgets/app_text_form_field.dart';
import 'package:diva/features/manage_product/widgets/image_picker_view.dart';
import 'package:flutter/material.dart';

class ManageProductScreen extends StatelessWidget {
  const ManageProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final titleStyle = TextStyles.font24BlackW600;
    return Scaffold(
      appBar: AppBar(title: const Text('Manage Product')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeadline('Product Image'),
              verticalSpace(16),
              ImagePickerView(
                getImage: (image) {},
              ),
              verticalSpace(24),
              const SectionHeadline('General info'),
              verticalSpace(8),
              Text('Product name', style: titleStyle),
              verticalSpace(4),
              AppTextFormField(
                borderRadius: BorderRadius.circular(13),
                hintText: 'Ex: wrapped dress',
              ),
              verticalSpace(8),
              Text('Product description', style: titleStyle),
              verticalSpace(4),
              AppTextFormField(
                borderRadius: BorderRadius.circular(13),
                hintText:
                    'Ex: long Italian silky dress with wrapped waist bla bla '
                    'bla bla bla bla bla bla',
                maxLines: 5,
              ),
              verticalSpace(8),
              Text('Category', style: titleStyle),
              verticalSpace(4),
              AppDropdownTextField(
                borderRadius: BorderRadius.circular(13),
                options: const [
                  'Dresses',
                  'Tops',
                  'Bottoms',
                  'Jackets',
                  'Shoes',
                  'Accessories',
                ],
              ),
              verticalSpace(8),
              Text('Price', style: titleStyle),
              verticalSpace(4),
              AppTextFormField(
                borderRadius: BorderRadius.circular(13),
                hintText: 'Ex: 580',
              ),
              verticalSpace(24),
              AppTextButton(
                buttonText: 'Add product',
                textStyle: titleStyle,
                onPressed: () {},
              ),
              verticalSpace(24),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionHeadline extends StatelessWidget {
  const SectionHeadline(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: TextStyles.font24BlackW600);
  }
}
