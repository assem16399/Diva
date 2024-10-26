import 'package:diva/core/helpers/extensions.dart';
import 'package:diva/core/helpers/spacing.dart';
import 'package:diva/core/themes/colors.dart';
import 'package:diva/core/themes/text_styles.dart';
import 'package:diva/core/widgets/app_drop_down_text_field.dart';
import 'package:diva/core/widgets/app_text_button.dart';
import 'package:diva/core/widgets/app_text_form_field.dart';
import 'package:diva/core/widgets/error_dialog.dart';
import 'package:diva/core/widgets/success_dialog.dart';
import 'package:diva/features/manage_product/data/models/mange_product_body_model.dart';
import 'package:diva/features/manage_product/logic/manage_product_cubit.dart';
import 'package:diva/features/manage_product/logic/manage_product_state.dart';
import 'package:diva/features/manage_product/widgets/image_picker_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManageProductScreen extends StatelessWidget {
  const ManageProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Manage Product')),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: ManageProductMap(),
        ),
      ),
    );
  }
}

class ManageProductMap extends StatefulWidget {
  const ManageProductMap({
    super.key,
  });

  @override
  State<ManageProductMap> createState() => _ManageProductMapState();
}

class _ManageProductMapState extends State<ManageProductMap> {
  var _product = ManageProductModel();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final titleStyle = TextStyles.font16BlackW600;

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeadline('Product Image'),
          verticalSpace(16),
          ImagePickerView(
            getImage: (image) {
              setState(() {
                _product = _product.copyWith(image: image);
              });
            },
          ),
          verticalSpace(24),
          const SectionHeadline('General info'),
          verticalSpace(8),
          Text('Product name', style: titleStyle),
          verticalSpace(4),
          AppTextFormField(
            borderRadius: BorderRadius.circular(13),
            hintText: 'Ex: wrapped dress',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a product name';
              }
              return null;
            },
            onSaved: (value) => _product = _product.copyWith(title: value),
          ),
          verticalSpace(8),
          Text('Product description', style: titleStyle),
          verticalSpace(4),
          AppTextFormField(
            borderRadius: BorderRadius.circular(13),
            hintText: 'Ex: long Italian silky dress with wrapped waist',
            maxLines: 5,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a product description';
              }
              return null;
            },
            onSaved: (value) =>
                _product = _product.copyWith(description: value),
          ),
          verticalSpace(8),
          Text('Category', style: titleStyle),
          verticalSpace(4),
          BlocBuilder<ManageProductCubit, ManageProductState>(
            buildWhen: (previous, current) =>
                current.action == ManageProductAction.fetchingCategories,
            builder: (context, state) {
              return state.categoryDataState.when(
                initial: () => AppDropdownTextField(
                  borderRadius: BorderRadius.circular(13),
                ),
                loading: () => AppDropdownTextField(
                  borderRadius: BorderRadius.circular(13),
                ),
                loaded: (categories) => AppDropdownTextField(
                  borderRadius: BorderRadius.circular(13),
                  options: categories,
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a category';
                    }
                    return null;
                  },
                  onSaved: (value) =>
                      _product = _product.copyWith(category: value! as String),
                ),
                error: Text.new,
              );
            },
          ),
          verticalSpace(8),
          Text('Price', style: titleStyle),
          verticalSpace(4),
          AppTextFormField(
            borderRadius: BorderRadius.circular(13),
            hintText: 'Ex: 580',
            textInputType: TextInputType.number,
            onSaved: (value) =>
                _product = _product.copyWith(price: double.parse(value!)),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a price';
              }
              return null;
            },
          ),
          verticalSpace(24),
          SubmitFormButton(formKey: _formKey, product: _product),
          verticalSpace(24),
        ],
      ),
    );
  }
}

class SubmitFormButton extends StatelessWidget {
  const SubmitFormButton({
    required GlobalKey<FormState> formKey,
    required ManageProductModel product,
    super.key,
  })  : _formKey = formKey,
        _product = product;

  final GlobalKey<FormState> _formKey;
  final ManageProductModel _product;

  bool _isThereCurrentDialogShowing(BuildContext context) =>
      ModalRoute.of(context)?.isCurrent != true;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ManageProductCubit, ManageProductState>(
      listenWhen: (previous, current) =>
          current.action == ManageProductAction.add ||
          current.action == ManageProductAction.update,
      listener: (context, state) {
        state.manageProductState.whenOrNull(
          loading: () {
            showAdaptiveDialog<dynamic>(
              context: context,
              routeSettings: const RouteSettings(name: 'loadingManageProduct'),
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.mainDeepPink,
                ),
              ),
            );
          },
          loaded: (product) {
            context.pop();
            showAdaptiveDialog<dynamic>(
              context: context,
              builder: (context) => SuccessDialog(
                title: 'Product Added',
                content: 'Product has been added successfully',
                onActionPressed: () {
                  context.pop();
                },
              ),
            );
          },
          error: (error) {
            if (_isThereCurrentDialogShowing(context)) context.pop();
            showAdaptiveDialog<dynamic>(
              context: context,
              builder: (context) => ErrorDialog(
                errorMsg: error,
              ),
            );
          },
        );
      },
      buildWhen: (previous, current) =>
          current.action == ManageProductAction.add ||
          current.action == ManageProductAction.update,
      builder: (context, state) {
        return AppTextButton(
          buttonText: 'Add product',
          textStyle: TextStyles.font20WhiteW600,
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();

              if (_product.image == null) {
                showAdaptiveDialog<dynamic>(
                  context: context,
                  builder: (context) => const ErrorDialog(
                    errorMsg: 'Please select an image',
                  ),
                );
                return;
              }
              context.read<ManageProductCubit>().addProduct(_product);
            }
          },
        );
      },
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
