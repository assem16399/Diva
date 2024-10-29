import 'dart:convert';

import 'package:diva/core/themes/colors.dart';
import 'package:diva/core/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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

  Future<void> _onPickerPressed() async {
    final picker = ImagePicker();

    final imageFile =
        await picker.pickImage(source: ImageSource.gallery, maxWidth: 600);
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
