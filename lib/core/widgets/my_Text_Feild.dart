import 'package:diva/core/themes/colors.dart';
import 'package:flutter/material.dart';

import '../themes/styles.dart';

class mytextfeild extends StatelessWidget {
  const mytextfeild({
    super.key,
    required this.hintText,
    required this.obscureText,
    required this.Controller,
    this.isObscureText,
    this.suffixIcon,
    this.hintStyle,
    this.inputTextStyle,
  });

  final TextStyle? hintStyle;
  final TextStyle? inputTextStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextEditingController Controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: TextField(
        controller: Controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white10,
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: ColorsManager.mainDeepPink),
          ),
          fillColor: Colors.white,
          filled: true,
          hintText: hintText,
          hintStyle: hintStyle ?? TextStyles.font14GreyRegular,
          suffixIcon: suffixIcon,
        ),
        obscureText: obscureText,
      ),
    );
  }
}
