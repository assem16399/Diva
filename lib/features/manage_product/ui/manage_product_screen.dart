import 'dart:convert';

import 'package:diva/core/helpers/spacing.dart';
import 'package:diva/core/themes/colors.dart';
import 'package:diva/core/themes/text_styles.dart';
import 'package:diva/core/widgets/app_drop_down_text_field.dart';
import 'package:diva/core/widgets/app_text_button.dart';
import 'package:diva/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ManageProductScreen extends StatelessWidget {
  const ManageProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Product'),
      ),
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
              Text('Product name', style: TextStyles.font16BlackW600),
              verticalSpace(4),
              AppTextFormField(
                borderRadius: BorderRadius.circular(13),
                hintText: 'Ex: wrapped dress',
              ),
              verticalSpace(8),
              Text('Product description', style: TextStyles.font16BlackW600),
              verticalSpace(4),
              AppTextFormField(
                borderRadius: BorderRadius.circular(13),
                hintText:
                    'Ex: long Italian silky dress with wrapped waist bla bla bla '
                    'bla bla bla bla bla',
                maxLines: 5,
              ),
              verticalSpace(8),
              Text('Category', style: TextStyles.font16BlackW600),
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
              Text('Price', style: TextStyles.font16BlackW600),
              verticalSpace(4),
              AppTextFormField(
                borderRadius: BorderRadius.circular(13),
                hintText: 'Ex: 580',
              ),
              verticalSpace(24),
              AppTextButton(
                buttonText: 'Add product',
                textStyle: TextStyles.font20WhiteW600,
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

class ImagePickerView extends StatefulWidget {
  const ImagePickerView({
    required this.getImage,
    super.key,
    this.image,
  });

  final String? image;
  final void Function(String?) getImage;

  @override
  State<ImagePickerView> createState() => _ImagePickerViewState();
}

class _ImagePickerViewState extends State<ImagePickerView> {
  late String? _image;

  @override
  void initState() {
    super.initState();
    _image = widget.image;
  }

  void _onPickerPressed() async {
    final picker = ImagePicker();

    final imageFile =
        await picker.pickImage(source: ImageSource.camera, maxWidth: 600);
    if (imageFile == null) return;

    final imageBytes = await imageFile.readAsBytes();
    final imageString = base64.encode(imageBytes);

    if (imageString != _image) {
      widget.getImage(imageString);
      setState(() => _image = imageString);
    }
  }

  void _deleteImage() {
    if (_image != null) {
      widget.getImage(null);
      setState(() => _image = null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onPickerPressed,
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: ColorsManager.shadedBlue,
          borderRadius: const BorderRadius.all(Radius.circular(13)),
          border: Border.all(color: Colors.black.withOpacity(0.2)),
          image: _image != null
              ? DecorationImage(
                  image: MemoryImage(base64.decode(_image!)),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: _image == null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.image,
                    color: Colors.black,
                  ),
                  Text(
                    'Add Image',
                    style: TextStyles.font14GreyRegular.copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.blue,
                      color: Colors.blue,
                    ),
                  ),
                ],
              )
            : Align(
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.only(topRight: Radius.circular(13)),
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: FittedBox(
                      child: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Theme.of(context).colorScheme.error,
                        ),
                        onPressed: _deleteImage,
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}

class SectionHeadline extends StatelessWidget {
  const SectionHeadline(
    this.title, {
    super.key,
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(title, style: TextStyles.font24BlackW600);
  }
}
