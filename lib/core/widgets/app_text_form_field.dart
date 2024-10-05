import 'package:diva/core/themes/colors.dart';
import 'package:diva/core/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.hintText,
    this.isObscureText = false,
    this.suffixIcon,
    this.onTap,
    this.controller,
    this.focusNode,
    this.focusedBorder,
    this.enabledBorder,
    this.hintStyle,
    this.backgroundColor,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.contentPadding,
    this.prefixIcon,
  });

  final String? hintText;
  final bool isObscureText;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  final EdgeInsetsGeometry? contentPadding;

  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? hintStyle;
  final Color? backgroundColor;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;

  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      obscureText: isObscureText,
      controller: controller,
      onTap: onTap,
      onChanged: onChanged,
      validator: validator,
      onSaved: onSaved,
      style: TextStyles.font18BlackW400,
      decoration: InputDecoration(
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: TextStyles.font18SemiTransparentBlackW400,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            width: 2,
            color: ColorsManager.lightGray,
          ),
        ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                width: 2,
                color: ColorsManager.lightGray,
              ),
            ),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                width: 2,
                color: ColorsManager.vividRed,
              ),
            ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            width: 2,
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            width: 2,
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        fillColor: backgroundColor,
      ),
    );
  }
}
