import 'package:diva/core/themes/colors.dart';
import 'package:diva/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';

class ObscuredTextFormField extends StatefulWidget {
  const ObscuredTextFormField({
    super.key,
    this.hintText,
    this.isObscureText = true,
  });

  final String? hintText;
  final bool isObscureText;

  @override
  State<ObscuredTextFormField> createState() => _ObscuredTextFormFieldState();
}

class _ObscuredTextFormFieldState extends State<ObscuredTextFormField> {
  late bool isObscure;

  @override
  void initState() {
    super.initState();
    isObscure = widget.isObscureText;
  }

  void _toggleTextVisibility() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      isObscureText: isObscure,
      hintText: widget.hintText,
      suffixIcon: IconButton(
        icon: Icon(
          isObscure ? Icons.visibility : Icons.visibility_off,
          color: ColorsManager.shadedDarkGray,
        ),
        onPressed: _toggleTextVisibility,
      ),
    );
  }
}
