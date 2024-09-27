import 'package:diva/core/helpers/spacing.dart';
import 'package:diva/core/themes/styles.dart';
import 'package:diva/core/widgets/app_text_button.dart';
import 'package:diva/core/widgets/app_text_form_field.dart';
import 'package:diva/core/widgets/obscured_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppTextFormField(
          hintText: 'E-mail',
        ),
        verticalSpace(16),
        const ObscuredTextFormField(
          hintText: 'Password',
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
        verticalSpace(24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already have an account? ',
              style: TextStyles.font14BlackW400,
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                'Login',
                style: TextStyles.font14MainDeepPinkW400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
