import 'package:diva/core/helpers/spacing.dart';
import 'package:diva/core/themes/text_styles.dart';
import 'package:diva/core/widgets/auth_screen_title.dart';
import 'package:diva/features/signup/ui/widgets/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpace(20),
              const AuthScreenTitle(title: 'Sign Up'),
              verticalSpace(24),
              SizedBox(
                width: 240.w,
                height: 240.w,
                child: Image.asset('assets/images/signup.png'),
              ),
              verticalSpace(1.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: const SignupForm(),
              ),
              verticalSpace(24),
              const AlreadyHaveAnAccountText(),
            ],
          ),
        ),
      ),
    );
  }
}

class AlreadyHaveAnAccountText extends StatelessWidget {
  const AlreadyHaveAnAccountText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
