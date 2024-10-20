import 'package:diva/core/themes/colors.dart';
import 'package:diva/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';

class ObscuredTextFormField extends StatefulWidget {
  const ObscuredTextFormField({
    super.key,
    this.hintText,
    this.isObscureText = true,
    this.onTap,
    this.controller,
    this.focusNode,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.hintStyle,
    this.backgroundColor,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.textInputType,
    this.autocorrect = false,
    this.borderRadius,
    this.maxLines,
  });

  final String? hintText;
  final bool isObscureText;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? hintStyle;
  final Color? backgroundColor;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final bool autocorrect;
  final BorderRadius? borderRadius;
  final int? maxLines;
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
      autocorrect: widget.autocorrect,
      onTap: widget.onTap,
      textInputType: widget.textInputType,
      onChanged: widget.onChanged,
      onSaved: widget.onSaved,
      validator: widget.validator,
      contentPadding: widget.contentPadding,
      backgroundColor: widget.backgroundColor,
      enabledBorder: widget.enabledBorder,
      focusedBorder: widget.focusedBorder,
      hintStyle: widget.hintStyle,
      focusNode: widget.focusNode,
      controller: widget.controller,
      isObscureText: isObscure,
      borderRadius: widget.borderRadius,
      hintText: widget.hintText,
      maxLines: widget.maxLines,
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
