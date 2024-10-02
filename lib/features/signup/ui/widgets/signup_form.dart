import 'package:diva/core/helpers/spacing.dart';
import 'package:diva/core/themes/text_styles.dart';
import 'package:diva/core/widgets/app_text_button.dart';
import 'package:diva/core/widgets/app_text_form_field.dart';
import 'package:diva/core/widgets/obscured_text_form_field.dart';
import 'package:diva/features/signup/ui/widgets/password_validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({
    super.key,
  });

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _passwordController = TextEditingController();
  final _passwordFocusNode = FocusNode();
  var _isPasswordFieldFocused = false;

  @override
  void initState() {
    super.initState();
    _passwordFocusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {
      _isPasswordFieldFocused = _passwordFocusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppTextFormField(
          hintText: 'E-mail',
        ),
        verticalSpace(16),
        ObscuredTextFormField(
          controller: _passwordController,
          focusNode: _passwordFocusNode,
          hintText: 'Password',
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          constraints: BoxConstraints(
            maxHeight: _isPasswordFieldFocused ? 100.h : 0,
          ),
          child: PasswordValidations(
            controller: _passwordController,
          ),
        ),
        verticalSpace(16),
        const ObscuredTextFormField(
          hintText: 'Confirm password',
        ),
        verticalSpace(24),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h),
          child: AppTextButton(
            buttonText: 'Sign Up',
            textStyle: TextStyles.font18WhiteW400,
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
    _passwordFocusNode
      ..removeListener(_onFocusChange)
      ..dispose();
  }
}
