import 'package:diva/core/helpers/app_regex.dart';
import 'package:diva/core/helpers/spacing.dart';
import 'package:diva/core/themes/text_styles.dart';
import 'package:diva/core/widgets/app_text_button.dart';
import 'package:diva/core/widgets/app_text_form_field.dart';
import 'package:diva/core/widgets/obscured_text_form_field.dart';
import 'package:diva/features/signup/data/models/signup_request_body.dart';
import 'package:diva/features/signup/logic/signup_cubit.dart';
import 'package:diva/features/signup/ui/widgets/password_validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({
    super.key,
  });

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordFocusNode = FocusNode();
  var _isPasswordFieldFocused = false;
  var _isPasswordCriteriaMet = false;
  final _formKey = GlobalKey<FormState>();

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

  void _onSignupPressed() {
    if (_formKey.currentState!.validate()) {
      context.read<SignupCubit>().emitSignupStates(
            SignupRequestBody(
              email: _emailController.text,
              password: _passwordController.text,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: _emailController,
            hintText: 'E-mail',
            textInputType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          verticalSpace(16),
          ObscuredTextFormField(
            controller: _passwordController,
            focusNode: _passwordFocusNode,
            hintText: 'Password',
            validator: (value) {
              if (value == null || value.isEmpty || !_isPasswordCriteriaMet) {
                return 'Please enter a valid password';
              }
              return null;
            },
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            constraints: BoxConstraints(
              maxHeight: _isPasswordFieldFocused ? 100.h : 0,
            ),
            child: PasswordValidations(
              controller: _passwordController,
              getPasswordValidationStatus: ({required bool isValid}) =>
                  _isPasswordCriteriaMet = isValid,
            ),
          ),
          verticalSpace(16),
          ObscuredTextFormField(
            hintText: 'Confirm password',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  value != _passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
          verticalSpace(24),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h),
            child: AppTextButton(
              buttonText: 'Sign Up',
              textStyle: TextStyles.font18WhiteW400,
              onPressed: _onSignupPressed,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordFocusNode
      ..removeListener(_onFocusChange)
      ..dispose();
  }
}
