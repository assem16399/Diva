import 'package:diva/core/helpers/spacing.dart';
import 'package:diva/core/themes/styles.dart';
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
              Text(
                'Sign Up',
                style: TextStyles.fontLibreBaskerville24BlackW400,
              ),
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
            ],
          ),
        ),
      ),
    );
  }
}
